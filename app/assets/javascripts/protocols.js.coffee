$ ->
  $(document).on 'click', '.substeps-nav .nav-link, a.back', (event) ->
    event.preventDefault()
    setActiveSubStep($(this).attr('href'))

  $(document).on 'click', '.validate', ->
    $.ajax
      type: 'get'
      dataType: 'script'
      url: '/protocol/validate'
      data:
        group: $(this).data('group')
        href: $(this).data('href')
        type: getProtocolType()

  toggleFederalDependents()
  $(document).on 'change', '#funding_source', ->
    toggleFederalDependents()

  toggleImpactAreaOther()
  $(document).on 'change', '#impact_area_other', ->
    toggleImpactAreaOther()

  $('[name=research_involving]').each ->
    toggleResearchInvolvingDependents($(this).data('category'))
  $(document).on 'change', '[name=research_involving]', ->
    console.log $(this).data('category')
    toggleResearchInvolvingDependents($(this).data('category'))

toggleFederalDependents = () ->
  if $('#funding_source').val() == 'Federal'
    $('.federal-dependent').removeClass('d-none')
  else
    $('.federal-dependent').addClass('d-none')

toggleImpactAreaOther = () ->
  if $('#impact_area_other').prop('checked')
    $('#impact_area_other_text').removeClass('d-none')
  else
    $('#impact_area_other_text').addClass('d-none')

toggleResearchInvolvingDependents = (category) ->
  if $("#research_involving_#{category.replace('-', '_')}").prop('checked')
    $(".#{category}-dependent").removeClass('d-none')
  else
    $(".#{category}-dependent").addClass('d-none')

(exports ? this).getProtocolType = () ->
  type = (new URL(window.location)).searchParams.get('type')

(exports ? this).setActiveSubStep = (href=window.location.hash) ->
  # Prevent scrolls when no hash is present or
  # when clicking the same link as the hash
  if href && href != window.location.hash
    window.location.hash = href

  if href.length == 0
    $(".substep-link#protocolInformation, .substep#protocolInformationSection").addClass('active')
  else
    $('.substep-link.active, .substep.active').removeClass('active')
    $(".substep-link#{href}, .substep#{href}Section").addClass('active').removeClass('disabled')
