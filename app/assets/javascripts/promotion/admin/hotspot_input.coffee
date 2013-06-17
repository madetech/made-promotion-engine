window.HotspotInput = class HotspotInput
  constructor: ->
    $(document).ready =>
      @setExistingHotspots()
      @attachInputs()

  setExistingHotspots: ->
    for hotspot in $('.hotspot-image')
      inputs = @getXYInputFields(hotspot)
      @dropHotspot(hotspot, inputs.x.attr('value'), inputs.y.attr('value')) if inputs.x.attr('value')

  attachInputs: ->
    return if $('.hotspot-image').length < 1

    $('.hotspot-image').on 'click', (event) =>
      @dropHotspot(event.delegateTarget, event.offsetX * 2, event.offsetY * 2)

  dropHotspot: (container, x, y) ->
    $(container).find('.hotspot-icon').remove()
    $(container).append(@buildHotspot(x, y))
    @updateXYInputFields(container, x, y)

  buildHotspot: (x, y) ->
    """
      <div class="hotspot-icon" style="top: #{(y - 15) / 2}px; left: #{(x - 15) / 2}px;"></div>
    """

  updateXYInputFields: (container, x, y) ->
    inputs = @getXYInputFields(container)
    inputs.x.attr('value', x)
    inputs.y.attr('value', y)

  getXYInputFields: (container) ->
    {
      x: $(container).closest('ol').find('.hotspot-x'),
      y: $(container).closest('ol').find('.hotspot-y')
    }

new HotspotInput()
