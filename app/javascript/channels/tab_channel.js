$('#myTab a').on('click', function (e) {
    e.preventDefault()
    $(this).tab('show')
})

$('#editBtn').on('click', function (e) {
    var x = $('#editDiv');
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
})