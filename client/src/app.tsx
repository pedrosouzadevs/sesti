import {X} from "lucide-react"

export function App() {
  return (
    <div className="flex place-content-center justify-around items-center h-screen">
      <div></div>
      <div></div>
      <div className="w-80 flex justify-center bg-slate-800 p-6 rounded-3xl drop-shadow h-5/6">
        <form className="space-y-6" >
          <div className="space-y-2 ">
            <label className="text-md text-justify font-medium  " htmlFor="title">Adicione as informações de sua sessão abaixo:</label>
            <textarea
              id="name"
              className="overflow-x-auto rounded-lg resize-none bg-slate-300 px-3 text-black text-sm py-2.5 h-96 w-full text-wrap "
            />
          </div>
          <div className="flex items-center gap-2 justify-center">
            <div>
              <button className="flex gap-1 items-center bg-red-600 p-1.5 rounded">
                Cancel
                <X className="size-3"/>
              </button>
            </div>
            <button className="bg-teal-400 text-teal-950 p-1.5 rounded" type="submit">
              Save
            </button>
          </div>
        </form>
      </div>
      <div className="w-80 flex justify-center bg-slate-700 p-6 rounded-3xl h-5/6">
        <form className="space-y-6" >
          <div className="space-y-2 ">
            <label className="text-md text-justify font-medium block " htmlFor="title">Adicione as informações de sua sessão abaixo:</label>
            <textarea
              id="name"
              className="border read_only overflow-x-auto border-zinc-800 rounded-lg resize-none bg-zinc-800/50 px-3 py-2.5 h-96 w-full text-wrap "
            />
          </div>
          <div className="flex items-center gap-2 justify-center">
            <div>
              <button className="flex gap-1 items-center bg-red-600 p-1.5 rounded">
                Cancel
                <X className="size-3"/>
              </button>
            </div>
            <button className="bg-teal-400 text-teal-950 p-1.5 rounded" type="submit">
              Save
            </button>
          </div>
        </form>
      </div>
      <div></div>
      <div></div>
    </div>
  )
}

/* Esse é o html de como deveria aparecer se a pessoa quiser ver uma preview

<div className="space-y-2">
  <label className="text-sm font-medium block " htmlFor="slug">Slug</label>
  <input
    value={slug}
    type="text"
    id="slug"
    className="border border-zinc-800 rounded-lg bg-zinc-800/50 px-3 py-2 w-full"
    readOnly
  />
</div> */
