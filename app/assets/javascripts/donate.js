$(function(){

  $("#name").focus();

  $("#citizen").prettyCheckable({
      color: 'gray'
  });

  $("#btn-print").click(function(e) {
    e.preventDefault();
    window.print();
  });

  $("#citizen").change(function() {
    if(!$("#citizen").prop('checked')) {
      alert("Добровольные пожертвования в избирательный фонд принимаются только от граждан Российской Федерации.")
      $(this).parent().find("a").toggleClass('checked');
      $("#citizen").prop('checked','checked');
    }
  });
    
  $("#pd4_form").submit(function() {

    filled = 
      $("#name").val()    &&
      $("#bdate").val()   &&
      $("#passp").val()   &&
      $("#address").val() &&
      $("#citizen").val() &&
      $("#amount").val();
      if(!filled) {
        alert("Заполните, пожалуйста, все поля.");
        return false;
      }

    if(!(/^[А-Яа-яЁё\-]+ [А-Яа-яЁё\-]+ [А-Яа-яЁё]+$/.test($("#name").val()))) {
      alert("Поле 'Фамилия Имя Отчество' должно содержать 3 слова, состоящих из русских букв и разделенных пробелами. В фамилии и отчестве допускается дефис.");
      $("#name").focus();
      return false;
    }

    if(!(/^\d{2}\.\d{2}\.\d{4}$/.test($("#bdate").val()))) {
      alert("Поле 'Дата рождения' должно содержать дату в формате ДД.ММ.ГГГГ");
      $("#bdate").focus();
      return false;
    }

    if(!(/^\d{4} \d{6}$/.test($("#passp").val()))) {
      alert("Поле 'Паспорт: серия номер' должно содержать серию из 4 цифр и номер из 6 цифр. Серия и номер должны быть разделены пробелом.");
      $("#passp").focus();
      return false;
    }

    if(!(/^[А-Яа-яЁё0-9\.\-\/\, ]+$/.test($("#address").val()))) {
      alert("Поле 'Адрес' может содержать только русские буквы, пробелы, а так же точку, запятую, тире и знак дроби.");
      $("#address").focus();
      return false;
    }

    if(!(/^\d+$/.test($("#amount").val()))) {
      alert("Поле 'Сумма пожертвования в рублях' может содержать только целое число.");
      $("#amount").focus();
      return false;
    }

    if(!$("#citizen").prop('checked')) {
      alert("Добровольные пожертвования в избирательный фонд принимаются только от граждан Российской Федерации.")
      return false;
    }

  });

});