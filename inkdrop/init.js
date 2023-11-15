inkdrop.commands.add(document.body, 'custom:new-daily', async () => {
  const db = inkdrop.main.dataStore.getLocalDB()
  const template = await db.notes.get('note:5gQPGf3ty')
  const note = {
    ...template,
    _id: db.notes.createId(),
    _rev: undefined,
    title: new Date().toISOString().slice(0, 10),
    createdAt: +new Date(),
    updatedAt: +new Date(),
    pinned: false
  }
  try {
    await db.notes.put(note)
    inkdrop.commands.dispatch(document.body, 'core:open-note', {
      noteId: note._id
    })
    inkdrop.commands.dispatch(document.body, 'editor:focus-mde')
  } catch (e) {
    console.error(e)
  }
})

inkdrop.menu.add([
  {
    label: 'File',
    submenu: [
      {
        label: 'Templates',
        submenu: [
          {
            label: 'Create a daily note',
            command: 'custom:new-daily'
          }
        ]
      }
    ]
  }
])
