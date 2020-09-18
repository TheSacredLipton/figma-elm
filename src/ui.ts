// @ts-ignore
import { Elm } from './Ui.elm'

const app = Elm.Ui.init({
  node: document.getElementById('main')
})

app.ports.create.subscribe((data) => {
  parent.postMessage({ pluginMessage: { type: 'create-rectangles', count: data } }, '*')
})
