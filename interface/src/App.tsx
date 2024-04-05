import { useEffect, useState } from "react"

export default function App() {
    const [name, handleName] = useState<string | null>(null)

    useEffect(() => {
        {/* @ Fetch user from fivem ui message */}
        window.addEventListener('message', (event) => {
            const {
                name
            } = event.data

            if(name) handleName(name)
        })
    }, [])

    return <main className="bg-zinc-600 h-screen w-screen flex items-center justify-center">
        {/* @ Background image */}
        <img 
            src="https://www.pngall.com/wp-content/uploads/15/GTA-PNG-Picture.png"
            className="absolute bottom-0 -right-60 h-full"
        />

        {/* @ Redeem modal modal */}
        <div className="border border-zinc-700 shadow-lg z-20 flex flex-col gap-2 bg-zinc-950 text-white p-5 rounded w-1/4">
            <h1 className="font-extrabold text-2xl">
                Bienvenido, { name || 'invitado' }
            </h1>

            <small className="text-zinc-500">
                Introduce el código que te proporcionaron para canjear tu premio
            </small>

            <input 
                type="text" 
                className="border mt-5 border-zinc-700 bg-zinc-900 text-sm text-white p-2.5 rounded w-full focus:outline-none focus:border-zinc-500"
                placeholder="..."
            />

            <button
                className="bg-zinc-700 text-white p-2.5 rounded w-full mt-2"
            >
                Canjear
            </button>
        </div>
    </main>
}