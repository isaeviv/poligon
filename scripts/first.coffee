class @PopupWindow

  attributes =
    title        : "Popup Window Title"
    windowHeight : 600
    windowWidth  : 600
    openOnCreate : true

  constructor : (@url, attrs = {}) ->
    throw new Error('A url is required to create a popup') unless url?

    $.extend attributes, attrs

    @title = attributes.title
    @windowHeight = attributes.windowHeight
    @windowWidth  = attributes.windowWidth
    @left = (screen.width/2) - (@windowWidth/2)
    @top  = (screen.height/2) - (@windowHeight/2)

    @open() if attributes.openOnCreate

  open : -> window.open @url, @title, "toolbar=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=#{@windowWidth}, height=#{@windowHeight}, top=#{@top}, left=#{@left}"
