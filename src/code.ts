figma.showUI('<div id="main"></div>' + __html__)
figma.ui.resize(300, 300)

figma.ui.onmessage = msg => {
  if (msg.type === 'create-rectangles') {
    const nodes = []

    for (let i = 0; i < msg.count; i++) {
      const rect = figma.createRectangle()
      rect.x = i * 150
      rect.x = figma.viewport.center.x + i * 150
      rect.y = figma.viewport.center.y
      rect.fills = [{ type: 'SOLID', color: { r: 1, g: 0.5, b: 0 } }]
      figma.currentPage.appendChild(rect)
      nodes.push(rect)
    }

    figma.currentPage.selection = nodes
    figma.viewport.scrollAndZoomIntoView(nodes)
  }

  figma.closePlugin()
}