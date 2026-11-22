// =============================================================================
// Общий модуль: ФормированиеХарактеристикСПКСервер
// Назначение: Автоматизированный сбор сведений из учетных регистров,
// генерация текста характеристики с учетом пола обучающегося и вывод
// официальной печатной формы АУ «Сургутский политехнический колледж».
// Автор разработки: Латыпов Айнур Гиндуллович (ID 70187744)
// =============================================================================

// Возвращает двоичную картинку официального логотипа АУ «СПК»
Функция ПолучитьЛоготипКолледжа() Экспорт
	СтрокаБ64 = "/9j/4AAQSkZJRgABAQEA3ADcAAD/2wBDAAIBAQEBAQIBAQECAgICAgQDAgICAgUEBAMEBgUGBgYFBgYGBwkIBgcJBwYGCAsICQoK
	|CgoKBggLDAsKDAkKCgr/2wBDAQICAgICAgUDAwUKBwYHCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoK
	|CgoKCgoKCgr/wAARCACmAREDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUF
	|BAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVW
	|V1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi
	|4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAEC
	|AxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVm
	|Z2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq
	|8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD9/KKKKACiiigAooooAKKKKACiiigBBhsg9jSFlOQTnHal3DOK+Uf+CsH/AAUi8J/8E9fg
	|HPq+nz215471+GS38IaPI2f3uMG5kXr5Uecn+8cL3yOjB4PEY/FQw9CN5Sdkc+JxNHCUJVarskbfxm/ahPxA/au8P/sK/BXUTNq/
	|lf2z8SNVtm+XRdJjIIg3DpPO5VAP4VJPcV9IwRJDGI0GFVQFA6AV8Bf8EA/2evF2gfADXf2w/jHd3GoeN/jDqh1C81G+OZjZIzeU
	|M9gzM746YKjoBX3+Mjg115vRoYTFvC0ndU9G+8vtP0vovJHPltWriMP7eorOeqXZdPw1FooorzD0AooooAKKKKACiiigAooooAKK
	|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
	|RRQB/9k=";
	Если ПустаяСтрока(СтрокаБ64) Тогда
		Возврат Неопределено;
	КонецЕсли;
	ДвоичныеДанные = Base64Значение(СтрокаБ64);
	КартинкаЛоготипа = Новый Картинка(ДвоичныеДанные);
	Возврат КартинкаЛоготипа;
КонецФункции

// Определяет краткое имя студента из полного ФИО в именительном падеже
Функция ВыделитьИмяСтудента(ПолноеФИО) Экспорт
	СтрокаФИО = СокрЛП(ПолноеФИО);
	Части = СтрРазделить(СтрокаФИО, " ", Ложь);
	Если Части.Количество() >= 2 Тогда
		Возврат Части[1];
	ИначеЕсли Части.Количество() = 1 Тогда
		Возврат Части[0];
	КонецЕсли;
	Возврат "Обучающийся";
КонецФункции

// Возвращает структуру грамматических форм в зависимости от пола студента
Функция ПолучитьГрамматическийПрофильПола(ПолСтудента) Экспорт
	Профиль = Новый Структура;
	ЭтоЖенский = (ПолСтудента = Перечисления.ПолФизическогоЛица.Женский);
	Если ЭтоЖенский Тогда
		Профиль.Вставить("Существительное", "студентка");
		Профиль.Вставить("ОбучающегосяРод", "обучающегося");
		Профиль.Вставить("ПроживающегоРод", "проживающей");
		Профиль.Вставить("НеБыл", "не была");
		Профиль.Вставить("ПринималЗагл", "Принимала");
		Профиль.Вставить("МестоимениеИм", "она");
		Профиль.Вставить("МестоимениеРод", "её");
		Профиль.Вставить("МестоимениеДат", "ей");
		Профиль.Вставить("ПроявилСебя", "проявила себя");
		Профиль.Вставить("Показал", "показала");
		Профиль.Вставить("Аттестован", "аттестована");
		Профиль.Вставить("Обучался", "обучалась");
		Профиль.Вставить("Предпринял", "предприняла");
		Профиль.Вставить("Накопил", "накопила");
		Профиль.Вставить("Принимал", "принимала");
		Профиль.Вставить("Зарекомендовал", "зарекомендовала");
		Профиль.Вставить("Воспитывался", "воспитывается");
		Профиль.Вставить("СынДочь", "дочери");
		Профиль.Вставить("Организованный", "организованная и дисциплинированная студентка");
		Профиль.Вставить("Слабоуспевающий", "неорганизованная и слабоуспевающая студентка, демонстрирующая");
		Профиль.Вставить("Удовлетворительный", "уравновешенная студентка со средним уровнем учебной мотивации");
	Иначе
		Профиль.Вставить("Существительное", "студент");
		Профиль.Вставить("ОбучающегосяРод", "обучающегося");
		Профиль.Вставить("ПроживающегоРод", "проживающего");
		Профиль.Вставить("НеБыл", "не был");
		Профиль.Вставить("ПринималЗагл", "Принимал");
		Профиль.Вставить("МестоимениеИм", "он");
		Профиль.Вставить("МестоимениеРод", "его");
		Профиль.Вставить("МестоимениеДат", "ему");
		Профиль.Вставить("ПроявилСебя", "проявил себя");
		Профиль.Вставить("Показал", "показал");
		Профиль.Вставить("Аттестован", "аттестован");
		Профиль.Вставить("Обучался", "обучался");
		Профиль.Вставить("Предпринял", "предпринял");
		Профиль.Вставить("Накопил", "накопил");
		Профиль.Вставить("Принимал", "принимал");
		Профиль.Вставить("Зарекомендовал", "зарекомендовал");
		Профиль.Вставить("Воспитывался", "воспитывается");
		Профиль.Вставить("СынДочь", "сына");
		Профиль.Вставить("Организованный", "организованный и ответственный студент");
		Профиль.Вставить("Слабоуспевающий", "неорганизованный и слабоуспевающий студент, демонстрирующий");
		Профиль.Вставить("Удовлетворительный", "исполнительный студент со стабильным уровнем учебной дисциплины");
	КонецЕсли;
	Возврат Профиль;
КонецФункции

// Склоняет числительное для списка неаттестованных дисциплин в дательном падеже
Функция ЧислительноеДисциплинДательный(Количество) Экспорт
	Если Количество = 1 Тогда
		Возврат "одной дисциплине";
	ИначеЕсли Количество = 2 Тогда
		Возврат "двум дисциплинам";
	ИначеЕсли Количество = 3 Тогда
		Возврат "трем дисциплинам";
	ИначеЕсли Количество = 4 Тогда
		Возврат "четырем дисциплинам";
	ИначеЕсли Количество = 5 Тогда
		Возврат "пяти дисциплинам";
	ИначеЕсли Количество = 6 Тогда
		Возврат "шести дисциплинам";
	ИначеЕсли Количество = 7 Тогда
		Возврат "семи дисциплинам";
	ИначеЕсли Количество = 8 Тогда
		Возврат "восьми дисциплинам";
	КонецЕсли;
	Возврат Формат(Количество, "ЧГ=0") + " дисциплинам";
КонецФункции

// Склоняет существительное «час» в зависимости от числительного
Функция СклонятьЧасыПропусков(КоличествоЧасов) Экспорт
	Ч = Цел(Макс(0, КоличествоЧасов));
	Остаток100 = Ч % 100;
	Остаток10 = Ч % 10;
	Если Остаток100 >= 11 И Остаток100 <= 19 Тогда
		Слово = "часов";
	ИначеЕсли Остаток10 = 1 Тогда
		Слово = "час";
	ИначеЕсли Остаток10 >= 2 И Остаток10 <= 4 Тогда
		Слово = "часа";
	Иначе
		Слово = "часов";
	КонецЕсли;
	Возврат Формат(Ч, "ЧГ=0;ЧН=0") + " " + Слово;
КонецФункции

// Склоняет числительное для списка неаттестованных дисциплин в творительном падеже
Функция ЧислительноеДисциплинТворительный(Количество) Экспорт
	Если Количество = 1 Тогда
		Возврат "одной дисциплиной";
	ИначеЕсли Количество = 2 Тогда
		Возврат "двумя дисциплинами";
	ИначеЕсли Количество = 3 Тогда
		Возврат "тремя дисциплинами";
	ИначеЕсли Количество = 4 Тогда
		Возврат "четырьмя дисциплинами";
	ИначеЕсли Количество = 5 Тогда
		Возврат "пятью дисциплинами";
	ИначеЕсли Количество = 6 Тогда
		Возврат "шестью дисциплинами";
	ИначеЕсли Количество = 7 Тогда
		Возврат "семью дисциплинами";
	КонецЕсли;
	Возврат Формат(Количество, "ЧГ=0;ЧН=0") + " дисциплинами";
КонецФункции

// Собирает показатели студента из всех 5 регистров конфигурации одним пакетным запросом
Функция СобратьУчетныеПоказателиСтудента(СтудентСсылка) Экспорт
	Данные = Новый Структура;
	Данные.Вставить("СреднийБалл1Полугодие", 0);
	Данные.Вставить("СреднийБалл2Полугодие", 0);
	Данные.Вставить("СреднийБаллОбщий", 0);
	Данные.Вставить("ЗадолженностиКурс1", Новый Массив);
	Данные.Вставить("ЗадолженностиКурс2", Новый Массив);
	Данные.Вставить("ЗадолженностиКурс3", Новый Массив);
	Данные.Вставить("ЧасыВсего", 0);
	Данные.Вставить("ЧасыНеуважительные", 0);
	Данные.Вставить("ЧасыУважительные", 0);
	Данные.Вставить("Часы1Полугодие", 0);
	Данные.Вставить("Часы2Полугодие", 0);
	Данные.Вставить("КоличествоОпозданий", 0);
	Данные.Вставить("БаллыАктивности", 0);
	Данные.Вставить("КоличествоМероприятий", 0);
	Данные.Вставить("СписокМероприятий", Новый Массив);
	Данные.Вставить("КоличествоЗамечаний", 0);
	Данные.Вставить("КоличествоБесед", 0);
	Данные.Вставить("ШтрафныеБаллы", 0);
	Данные.Вставить("ПсихологическаяХарактеристика", "");
	Данные.Вставить("ОтношениеКВреднымПривычкам", "");
	Данные.Вставить("ВзаимоотношенияВСемье", "");
	Данные.Вставить("ДополнительныеСведенияИВПК", "");
	Данные.Вставить("ПроведеннаяПрофилактическаяРабота", "");

	Если Не ЗначениеЗаполнено(СтудентСсылка) Тогда
		Возврат Данные;
	КонецЕсли;

	// 1. Запрос к регистру сведений успеваемости и академических задолженностей
	ЗапросУсп = Новый Запрос;
	ЗапросУсп.Текст =
		"ВЫБРАТЬ
		|	Рег.Курс КАК Курс,
		|	Рег.УчебныйПериод.НомерПолугодия КАК НомерПолугодия,
		|	Рег.УчебнаяДисциплина.Наименование КАК ДисциплинаНаименование,
		|	Рег.СреднийБалл КАК СреднийБалл,
		|	Рег.ОценкаПоДисциплине КАК Оценка,
		|	Рег.НеАттестован КАК НеАттестован
		|ИЗ
		|	РегистрСведений.СводныеПоказателиУспеваемостиИЗадолженностей КАК Рег
		|ГДЕ
		|	Рег.Студент = &Студент";
	ЗапросУсп.УстановитьПараметр("Студент", СтудентСсылка);
	ВыборкаУсп = ЗапросУсп.Выполнить().Выбрать();

	Сумма1 = 0; Кол1 = 0;
	Сумма2 = 0; Кол2 = 0;
	Пока ВыборкаУсп.Следующий() Цикл
		Если ВыборкаУсп.НеАттестован Тогда
			ИмяДисц = """" + СокрЛП(ВыборкаУсп.ДисциплинаНаименование) + """";
			Если ВыборкаУсп.Курс = 1 Тогда
				Если Данные.ЗадолженностиКурс1.Найти(ИмяДисц) = Неопределено Тогда
					Данные.ЗадолженностиКурс1.Добавить(ИмяДисц);
				КонецЕсли;
			ИначеЕсли ВыборкаУсп.Курс = 2 Тогда
				Если Данные.ЗадолженностиКурс2.Найти(ИмяДисц) = Неопределено Тогда
					Данные.ЗадолженностиКурс2.Добавить(ИмяДисц);
				КонецЕсли;
			Иначе
				Если Данные.ЗадолженностиКурс3.Найти(ИмяДисц) = Неопределено Тогда
					Данные.ЗадолженностиКурс3.Добавить(ИмяДисц);
				КонецЕсли;
			КонецЕсли;
		КонецЕсли;
		БаллЗаписи = ВыборкаУсп.СреднийБалл;
		Если БаллЗаписи = 0 И ВыборкаУсп.Оценка > 0 Тогда
			БаллЗаписи = ВыборкаУсп.Оценка;
		КонецЕсли;
		Если БаллЗаписи > 0 Тогда
			Если ВыборкаУсп.НомерПолугодия = 2 Тогда
				Сумма2 = Сумма2 + БаллЗаписи;
				Кол2 = Кол2 + 1;
			Иначе
				Сумма1 = Сумма1 + БаллЗаписи;
				Кол1 = Кол1 + 1;
			КонецЕсли;
		КонецЕсли;
	КонецЦикла;

	Если Кол1 > 0 Тогда
		Данные.СреднийБалл1Полугодие = Окр(Сумма1 / Кол1, 2);
	КонецЕсли;
	Если Кол2 > 0 Тогда
		Данные.СреднийБалл2Полугодие = Окр(Сумма2 / Кол2, 2);
	КонецЕсли;
	Если (Кол1 + Кол2) > 0 Тогда
		Данные.СреднийБаллОбщий = Окр((Сумма1 + Сумма2) / (Кол1 + Кол2), 2);
	КонецЕсли;

	// 2. Запрос к регистру накопления посещаемости и пропусков
	ЗапросПос = Новый Запрос;
	ЗапросПос.Текст =
		"ВЫБРАТЬ
		|	Обороты.УчебныйПериод.НомерПолугодия КАК НомерПолугодия,
		|	СУММА(Обороты.ЧасыПропусковВсегоОборот) КАК ЧасыВсего,
		|	СУММА(Обороты.ЧасыБезУважительнойПричиныОборот) КАК ЧасыНеуваж,
		|	СУММА(Обороты.КоличествоОпозданийОборот) КАК Опоздания
		|ИЗ
		|	РегистрНакопления.УчетПосещаемостиИПропусков.Обороты(, , , Студент = &Студент) КАК Обороты
		|СГРУППИРОВАТЬ ПО
		|	Обороты.УчебныйПериод.НомерПолугодия";
	ЗапросПос.УстановитьПараметр("Студент", СтудентСсылка);
	ВыборкаПос = ЗапросПос.Выполнить().Выбрать();

	Пока ВыборкаПос.Следующий() Цикл
		Данные.ЧасыВсего = Данные.ЧасыВсего + ВыборкаПос.ЧасыВсего;
		Данные.ЧасыНеуважительные = Данные.ЧасыНеуважительные + ВыборкаПос.ЧасыНеуваж;
		Данные.КоличествоОпозданий = Данные.КоличествоОпозданий + ВыборкаПос.Опоздания;
		Если ВыборкаПос.НомерПолугодия = 2 Тогда
			Данные.Часы2Полугодие = Данные.Часы2Полугодие + ВыборкаПос.ЧасыВсего;
		Иначе
			Данные.Часы1Полугодие = Данные.Часы1Полугодие + ВыборкаПос.ЧасыВсего;
		КонецЕсли;
	КонецЦикла;
	Данные.ЧасыУважительные = Макс(0, Данные.ЧасыВсего - Данные.ЧасыНеуважительные);

	// 3. Запрос к регистру накопления воспитательной активности
	ЗапросАкт = Новый Запрос;
	ЗапросАкт.Текст =
		"ВЫБРАТЬ
		|	Обороты.ВидМероприятия.Наименование КАК Мероприятие,
		|	СУММА(Обороты.БаллыАктивностиОборот) КАК Баллы,
		|	СУММА(Обороты.КоличествоМероприятийОборот) КАК КолМероприятий
		|ИЗ
		|	РегистрНакопления.РейтингВоспитательнойАктивности.Обороты(, , , Студент = &Студент) КАК Обороты
		|СГРУППИРОВАТЬ ПО
		|	Обороты.ВидМероприятия.Наименование";
	ЗапросАкт.УстановитьПараметр("Студент", СтудентСсылка);
	ВыборкаАкт = ЗапросАкт.Выполнить().Выбрать();
	Пока ВыборкаАкт.Следующий() Цикл
		Данные.БаллыАктивности = Данные.БаллыАктивности + ВыборкаАкт.Баллы;
		Данные.КоличествоМероприятий = Данные.КоличествоМероприятий + ВыборкаАкт.КолМероприятий;
		Если ЗначениеЗаполнено(ВыборкаАкт.Мероприятие) Тогда
			Данные.СписокМероприятий.Добавить(СокрЛП(ВыборкаАкт.Мероприятие));
		КонецЕсли;
	КонецЦикла;

	// 4. Запрос к регистру накопления дисциплинарных замечаний и профилактических мер
	ЗапросДисц = Новый Запрос;
	ЗапросДисц.Текст =
		"ВЫБРАТЬ
		|	СУММА(Обороты.КоличествоЗамечанийОборот) КАК Замечания,
		|	СУММА(Обороты.КоличествоПрофилактическихБеседОборот) КАК Беседы,
		|	СУММА(Обороты.ШтрафныеБаллыДисциплиныОборот) КАК Штраф
		|ИЗ
		|	РегистрНакопления.УчетДисциплинарныхЗамечанийИМер.Обороты(, , , Студент = &Студент) КАК Обороты";
	ЗапросДисц.УстановитьПараметр("Студент", СтудентСсылка);
	ВыборкаДисц = ЗапросДисц.Выполнить().Выбрать();
	Если ВыборкаДисц.Следующий() Тогда
		Если ВыборкаДисц.Замечания <> NULL Тогда
			Данные.КоличествоЗамечаний = ВыборкаДисц.Замечания;
		КонецЕсли;
		Если ВыборкаДисц.Беседы <> NULL Тогда
			Данные.КоличествоБесед = ВыборкаДисц.Беседы;
		КонецЕсли;
		Если ВыборкаДисц.Штраф <> NULL Тогда
			Данные.ШтрафныеБаллы = ВыборкаДисц.Штраф;
		КонецЕсли;
	КонецЕсли;

	// 5. Запрос к регистру сведений психолого-педагогического профиля
	ЗапросПроф = Новый Запрос;
	ЗапросПроф.Текст =
		"ВЫБРАТЬ ПЕРВЫЕ 1
		|	Проф.ПсихологическаяХарактеристика КАК ПсихологическаяХарактеристика,
		|	Проф.ОтношениеКВреднымПривычкам КАК ОтношениеКВреднымПривычкам,
		|	Проф.ВзаимоотношенияВСемье КАК ВзаимоотношенияВСемье,
		|	Проф.ДополнительныеСведенияИВПК КАК ДополнительныеСведенияИВПК,
		|	Проф.ПроведеннаяПрофилактическаяРабота КАК ПроведеннаяПрофилактическаяРабота
		|ИЗ
		|	РегистрСведений.ПсихологоПедагогическийПрофильСтудентов КАК Проф
		|ГДЕ
		|	Проф.Студент = &Студент";
	ЗапросПроф.УстановитьПараметр("Студент", СтудентСсылка);
	ВыборкаПроф = ЗапросПроф.Выполнить().Выбрать();
	Если ВыборкаПроф.Следующий() Тогда
		Данные.ПсихологическаяХарактеристика = СокрЛП(ВыборкаПроф.ПсихологическаяХарактеристика);
		Данные.ОтношениеКВреднымПривычкам = СокрЛП(ВыборкаПроф.ОтношениеКВреднымПривычкам);
		Данные.ВзаимоотношенияВСемье = СокрЛП(ВыборкаПроф.ВзаимоотношенияВСемье);
		Данные.ДополнительныеСведенияИВПК = СокрЛП(ВыборкаПроф.ДополнительныеСведенияИВПК);
		Данные.ПроведеннаяПрофилактическаяРабота = СокрЛП(ВыборкаПроф.ПроведеннаяПрофилактическаяРабота);
	КонецЕсли;

	Возврат Данные;
КонецФункции

// Заполняет реквизиты документа «ХарактеристикаСтудента» на основании учетных регистров
Процедура ЗаполнитьДокументХарактеристикаПоСтуденту(ДокументОбъект) Экспорт
	СтудентСсылка = ДокументОбъект.Студент;
	Если Не ЗначениеЗаполнено(СтудентСсылка) Тогда
		Возврат;
	КонецЕсли;

	ОбъектСтудента = СтудентСсылка.ПолучитьОбъект();
	ПолноеФИО = СокрЛП(СтудентСсылка.Наименование);
	ИмяКраткое = ВыделитьИмяСтудента(ПолноеФИО);
	ПолСтудента = ОбъектСтудента.Пол;
	Грам = ПолучитьГрамматическийПрофильПола(ПолСтудента);

	ДокументОбъект.ДатаРождения = ОбъектСтудента.ДатаРождения;
	ДокументОбъект.УчебнаяГруппа = ОбъектСтудента.УчебнаяГруппа;
	ДокументОбъект.Статус = ОбъектСтудента.Статус;
	ДокументОбъект.ГодПоступления = ОбъектСтудента.ГодПоступления;
	ДокументОбъект.АдресПроживания = ОбъектСтудента.АдресПроживания;

	Если ЗначениеЗаполнено(ОбъектСтудента.УчебнаяГруппа) Тогда
		ДокументОбъект.Курс = ОбъектСтудента.УчебнаяГруппа.Курс;
		ДокументОбъект.СтруктурноеПодразделение = ОбъектСтудента.УчебнаяГруппа.СтруктурноеПодразделение;
		Если Не ЗначениеЗаполнено(ДокументОбъект.Куратор) Тогда
			ДокументОбъект.Куратор = ОбъектСтудента.УчебнаяГруппа.Куратор;
		КонецЕсли;
	КонецЕсли;

	Если Не ЗначениеЗаполнено(ДокументОбъект.Организация) Тогда
		НаимОрг = Константы.НаименованиеОбразовательнойОрганизации.Получить();
		Если ПустаяСтрока(НаимОрг) Тогда
			НаимОрг = "АУ ""Сургутский политехнический колледж""";
		КонецЕсли;
		ДокументОбъект.Организация = НаимОрг;
	КонецЕсли;

	Показатели = СобратьУчетныеПоказателиСтудента(СтудентСсылка);
	КурсНомер = Макс(1, ДокументОбъект.Курс);
	КолДолгов1 = Показатели.ЗадолженностиКурс1.Количество();
	КолДолгов2 = Показатели.ЗадолженностиКурс2.Количество();
	КолДолгов3 = Показатели.ЗадолженностиКурс3.Количество();
	ВсегоДолгов = КолДолгов1 + КолДолгов2 + КолДолгов3;

	// 1. Формирование блока «Успеваемость» (без дублирования строк полугодий)
	Если ВсегоДолгов > 0 Тогда
		ТекстУсп = "За период обучения в СПК " + ИмяКраткое + " " + Грам.ПроявилСебя + " как "
			+ Грам.Слабоуспевающий + " систематические нарушения правил внутреннего распорядка. "
			+ "К ним относятся регулярные опоздания на занятия, пропуски занятий без уважительных причин и отсутствие аттестации по ряду предметов.";
		Если КолДолгов1 > 0 Тогда
			ТекстУсп = ТекстУсп + " В течение первого курса " + ИмяКраткое + " " + Грам.НеБыл + " " + Грам.Аттестован
				+ " по следующим " + ЧислительноеДисциплинДательный(КолДолгов1) + ": "
				+ СтрСоединить(Показатели.ЗадолженностиКурс1, ", ") + ".";
		КонецЕсли;
		Если КолДолгов2 > 0 Тогда
			ТекстУсп = ТекстУсп + " На втором курсе ситуация повторилась с " + ЧислительноеДисциплинТворительный(КолДолгов2) + ": "
				+ СтрСоединить(Показатели.ЗадолженностиКурс2, ", ") + ".";
		КонецЕсли;
		Если КолДолгов3 > 0 Тогда
			ТекстУсп = ТекстУсп + " На третьем курсе имеется задолженность по " + ЧислительноеДисциплинДательный(КолДолгов3) + ": "
				+ СтрСоединить(Показатели.ЗадолженностиКурс3, ", ") + ".";
		КонецЕсли;
		ТекстУсп = ТекстУсп + " Несмотря на неоднократно предоставляемые возможности для погашения задолженностей, "
			+ ИмяКраткое + " не " + Грам.Предпринял + " мер для исправления ситуации и улучшения своих оценок.";
	Иначе
		Балл1 = Показатели.СреднийБалл1Полугодие;
		Балл2 = ?(Показатели.СреднийБалл2Полугодие > 0, Показатели.СреднийБалл2Полугодие, Балл1);
		Балл1Стр = Формат(Балл1, "ЧДЦ=2;ЧРД=,;ЧН=0,00");
		Балл2Стр = Формат(Балл2, "ЧДЦ=2;ЧРД=,;ЧН=0,00");
		ОценкаЗнаний = ?(Показатели.СреднийБаллОбщий >= 4.5, "отличные и хорошие знания", "устойчивые хорошие знания");
		ТекстУсп = ИмяКраткое + " за период обучения на " + Формат(КурсНомер, "ЧГ=0;ЧН=0") + " курсе "
			+ Грам.Показал + " " + ОценкаЗнаний + " по общеобразовательным и профессиональным дисциплинам."
			+ Символы.ПС + "Средний балл за 1 полугодие - " + Балл1Стр
			+ Символы.ПС + "Срелний балл за 2 полvгодие - " + Балл2Стр;
	КонецЕсли;
	ДокументОбъект.Успеваемость = ТекстУсп;

	// 2. Формирование блока «Посещаемость»
	Если Показатели.ЧасыНеуважительные > 0 Тогда
		ТекстПос = ИмяКраткое + " систематически опаздывает на занятия (зафиксировано опозданий: "
			+ Формат(Показатели.КоличествоОпозданий, "ЧГ=0;ЧН=0") + "), и только за первое полугодие "
			+ Формат(КурсНомер, "ЧГ=0;ЧН=0") + " курса " + Грам.Накопил + " "
			+ СклонятьЧасыПропусков(Показатели.ЧасыНеуважительные) + " пропусков без уважительной причины.";
	Иначе
		Ч1 = Показатели.Часы1Полугодие;
		Ч2 = Показатели.Часы2Полугодие;
		ТекстПос = "За первое полугодие " + ИмяКраткое + " имеет " + СклонятьЧасыПропусков(Ч1)
			+ " пропусков занятий по уважительной причине."
			+ Символы.ПС + "За второе полугодие " + ИмяКраткое + " имеет " + СклонятьЧасыПропусков(Ч2)
			+ " пропусков занятий по уважительной причине. Пропусков без уважительной причины не имеет.";
	КонецЕсли;
	ДокументОбъект.Посещаемость = ТекстПос;

	// 3. Формирование блока «Психологическая характеристика»
	Если ЗначениеЗаполнено(Показатели.ПсихологическаяХарактеристика) Тогда
		ДокументОбъект.ПсихологическаяХарактеристика = Показатели.ПсихологическаяХарактеристика;
	ИначеЕсли ВсегоДолгов > 0 Тогда
		ДокументОбъект.ПсихологическаяХарактеристика = "Преподаватели неоднократно высказывали замечания по поводу успеваемости и поведения обучающегося. На критику реагирует формально, поручения выполняет после повторного контроля.";
	Иначе
		ДокументОбъект.ПсихологическаяХарактеристика = "По характеру " + ИмяКраткое + " отзывчивый, общительный и уравновешенный человек. С ответственностью относится к поручениям мастера производственного обучения и преподавателей. С ребятами в группе поддерживает дружеские отношения.";
	КонецЕсли;

	// 4. Формирование блока «Вредные привычки»
	Если ЗначениеЗаполнено(Показатели.ОтношениеКВреднымПривычкам) Тогда
		ДокументОбъект.ВредныеПривычки = Показатели.ОтношениеКВреднымПривычкам;
	Иначе
		ДокументОбъект.ВредныеПривычки = "Вредных привычек не имеет.";
	КонецЕсли;

	// 5. Формирование блока «Взаимоотношения в семье»
	Если ЗначениеЗаполнено(Показатели.ВзаимоотношенияВСемье) Тогда
		ДокументОбъект.ВзаимоотношенияВСемье = Показатели.ВзаимоотношенияВСемье;
	Иначе
		ДокументОбъект.ВзаимоотношенияВСемье = ИмяКраткое + " " + Грам.Воспитывался + " в полной семье, имеет доверительные отношения с родителями. Родители интересуются успехами " + Грам.СынДочь + " в колледже.";
	КонецЕсли;

	// 6. Формирование блока «Участие в общественной жизни»
	Если Показатели.СписокМероприятий.Количество() > 0 Тогда
		ПоручениеСтрока = "";
		Если ЗначениеЗаполнено(ОбъектСтудента.ОбщественноеПоручение) Тогда
			ПоручениеСтрока = " Выбранное общественное поручение в группе: " + СокрЛП(ОбъектСтудента.ОбщественноеПоручение.Наименование) + ".";
		КонецЕсли;
		ДокументОбъект.УчастиеВОбщественнойЖизни = ИмяКраткое + " активно участвует в общественной жизни группы и колледжа." + ПоручениеСтрока
			+ " " + Грам.ПринималЗагл + " участие в мероприятиях: " + СтрСоединить(Показатели.СписокМероприятий, "; ") + ".";
	Иначе
		ДокументОбъект.УчастиеВОбщественнойЖизни = ИмяКраткое + " принимает участие в общественной жизни группы и колледжа как исполнитель. Инициативу проявляет редко.";
	КонецЕсли;

	// 7. Формирование блока «Комментарий и профилактическая работа»
	Если ЗначениеЗаполнено(Показатели.ПроведеннаяПрофилактическаяРабота) Тогда
		ДокументОбъект.КомментарийИПрофилактика = "В отношении обучающегося проводилась следующая работа: " + Показатели.ПроведеннаяПрофилактическаяРабота;
	ИначеЕсли ЗначениеЗаполнено(Показатели.ДополнительныеСведенияИВПК) Тогда
		ДокументОбъект.КомментарийИПрофилактика = Показатели.ДополнительныеСведенияИВПК;
	Иначе
		ДокументОбъект.КомментарийИПрофилактика = "Дисциплинарных взысканий за период обучения не имеет.";
	КонецЕсли;

	// 8. Сборка единого официального текста характеристики в стиле бланка АУ «СПК»
	МассивАбзацев = Новый Массив;
	МассивАбзацев.Добавить(ДокументОбъект.Успеваемость);
	МассивАбзацев.Добавить(ДокументОбъект.Посещаемость);
	МассивАбзацев.Добавить(ДокументОбъект.ПсихологическаяХарактеристика);
	Если ЗначениеЗаполнено(ДокументОбъект.УчастиеВОбщественнойЖизни) Тогда
		МассивАбзацев.Добавить(ДокументОбъект.УчастиеВОбщественнойЖизни);
	КонецЕсли;
	Если ЗначениеЗаполнено(ДокументОбъект.ВзаимоотношенияВСемье) Тогда
		МассивАбзацев.Добавить(ДокументОбъект.ВзаимоотношенияВСемье + " " + ДокументОбъект.ВредныеПривычки);
	КонецЕсли;
	Если ЗначениеЗаполнено(ДокументОбъект.КомментарийИПрофилактика) Тогда
		МассивАбзацев.Добавить(ДокументОбъект.КомментарийИПрофилактика);
	КонецЕсли;
	ДокументОбъект.ИтоговыйТекстХарактеристики = СтрСоединить(МассивАбзацев, Символы.ПС + Символы.ПС);
КонецПроцедуры

// Формирует официальный табличный документ «Характеристика» на фирменном бланке АУ «СПК» с логотипом
Функция СформироватьТабличныйДокументХарактеристикаСПК(ДокументСсылка) Экспорт
	ТабДок = Новый ТабличныйДокумент;
	ТабДок.ИмяПараметровПечати = "ПАРАМЕТРЫ_ПЕЧАТИ_ХарактеристикаСПК";
	ТабДок.ОриентацияСтраницы = ОриентацияСтраницы.Портрет;
	ТабДок.ПолеСлева = 20;
	ТабДок.ПолеСправа = 15;
	ТабДок.ПолеСверху = 15;
	ТабДок.ПолеСнизу = 15;
	ТабДок.АвтоМасштаб = Истина;

	ШрифтШапки = Новый Шрифт("Times New Roman", 11, Истина);
	ШрифтПодразд = Новый Шрифт("Times New Roman", 11, Истина);
	ШрифтЗаголовка = Новый Шрифт("Times New Roman", 14, Истина);
	ШрифтТекста = Новый Шрифт("Times New Roman", 12, Ложь);
	ШрифтПодписи = Новый Шрифт("Times New Roman", 12, Ложь);

	ТабДок.Область("C1").ШиринаКолонки = 18;
	ТабДок.Область("C2").ШиринаКолонки = 26;
	ТабДок.Область("C3").ШиринаКолонки = 26;
	ТабДок.Область("C4").ШиринаКолонки = 26;

	// Строки 1-3: Логотип СПК слева и официальное наименование колледжа справа
	ОблЛого = ТабДок.Область("R1C1:R3C1");
	ОблЛого.Объединить();
	КартинкаЛого = ПолучитьЛоготипКолледжа();
	Если КартинкаЛого <> Неопределено Тогда
		РисунокЛого = ТабДок.Рисунки.Добавить(ТипРисункаТабличногоДокумента.Картинка);
		РисунокЛого.Картинка = КартинкаЛого;
		РисунокЛого.РазмерКартинки = РазмерКартинки.Пропорционально;
		РисунокЛого.Линия = Новый Линия(ТипЛинииРисункаТабличногоДокумента.Сплошная);
		РисунокЛого.Расположить(ОблЛого);
	КонецЕсли;

	ОблОрг = ТабДок.Область("R1C2:R3C4");
	ОблОрг.Объединить();
	ОблОрг.Шрифт = ШрифтШапки;
	ОблОрг.ГоризонтальноеПоложение = ГоризонтальноеПоложение.Центр;
	ОблОрг.ВертикальноеПоложение = ВертикальноеПоложение.Центр;
	ОблОрг.РазмещениеТекста = ТипРазмещенияТекстаТабличногоДокумента.Переносить;
	ОблОрг.Текст = "Автономное учреждение профессионального образования" + Символы.ПС
		+ "Ханты-Мансийского автономного округа – Югры" + Символы.ПС
		+ "«СУРГУТСКИЙ ПОЛИТЕХНИЧЕСКИЙ КОЛЛЕДЖ» (АУ «Сургутский политехнический колледж»)";
	ТабДок.Область("R1:R3").ВысотаСтроки = 22;

	// Строка 4: Наименование структурного подразделения
	НаимПодразд = "СТРУКТУРНОЕ ПОДРАЗДЕЛЕНИЕ – 2 (Отделение строительства и транспорта)";
	Если ЗначениеЗаполнено(ДокументСсылка.СтруктурноеПодразделение) Тогда
		НаимПодразд = СокрЛП(ДокументСсылка.СтруктурноеПодразделение.Наименование);
	КонецЕсли;
	ОблПодр = ТабДок.Область("R4C1:R4C4");
	ОблПодр.Объединить();
	ОблПодр.Шрифт = ШрифтПодразд;
	ОблПодр.ГоризонтальноеПоложение = ГоризонтальноеПоложение.Центр;
	ОблПодр.Текст = НаимПодразд;
	ТабДок.Область("R4").ВысотаСтроки = 24;

	// Строка 6: Заголовок «ХАРАКТЕРИСТИКА»
	ОблЗаг = ТабДок.Область("R6C1:R6C4");
	ОблЗаг.Объединить();
	ОблЗаг.Шрифт = ШрифтЗаголовка;
	ОблЗаг.ГоризонтальноеПоложение = ГоризонтальноеПоложение.Центр;
	ОблЗаг.Текст = "ХАРАКТЕРИСТИКА";
	ТабДок.Область("R6").ВысотаСтроки = 24;

	// Строка 7: Правый блок реквизитов студента в родительном падеже (ФИО, дата рождения, адрес)
	ФИОРод = СокрЛП(ДокументСсылка.Студент.ФамилияИмяОтчествоРодПадеж);
	Если ПустаяСтрока(ФИОРод) Тогда
		ФИОРод = СокрЛП(ДокументСсылка.Студент.Наименование);
	КонецЕсли;
	ДатаРождСтрока = Формат(ДокументСсылка.ДатаРождения, "ДФ=dd.MM.yyyy");
	АдресСтрока = СокрЛП(ДокументСсылка.АдресПроживания);
	ГруппаСтрока = СокрЛП(ДокументСсылка.УчебнаяГруппа.Наименование);
	ГрамПеч = ПолучитьГрамматическийПрофильПола(ДокументСсылка.Студент.Пол);

	ОблРекв = ТабДок.Область("R7C2:R7C4");
	ОблРекв.Объединить();
	ОблРекв.Шрифт = ШрифтТекста;
	ОблРекв.ГоризонтальноеПоложение = ГоризонтальноеПоложение.Право;
	ОблРекв.РазмещениеТекста = ТипРазмещенияТекстаТабличногоДокумента.Переносить;
	ОблРекв.Текст = ФИОРод + ", " + ДатаРождСтрока + " года рождения, " + ГрамПеч.ОбучающегосяРод + " учебной группы "
		+ ГруппаСтрока + ", " + ГрамПеч.ПроживающегоРод + " по адресу: " + АдресСтрока + ".";
	ТабДок.Область("R7").ВысотаСтроки = 46;

	// Строки 9-14: Основной структурированный текст характеристики по разделам
	СтрокаТекущая = 9;
	РазделыТекста = Новый Массив;
	РазделыТекста.Добавить(СокрЛП(ДокументСсылка.Успеваемость));
	РазделыТекста.Добавить(СокрЛП(ДокументСсылка.Посещаемость));
	РазделыТекста.Добавить(СокрЛП(ДокументСсылка.ПсихологическаяХарактеристика));
	РазделыТекста.Добавить(СокрЛП(ДокументСсылка.УчастиеВОбщественнойЖизни));
	РазделыТекста.Добавить(СокрЛП(ДокументСсылка.ВзаимоотношенияВСемье) + " " + СокрЛП(ДокументСсылка.ВредныеПривычки));
	РазделыТекста.Добавить(СокрЛП(ДокументСсылка.КомментарийИПрофилактика));

	Для Каждого АбзацТекст Из РазделыТекста Цикл
		Если ЗначениеЗаполнено(АбзацТекст) Тогда
			ОблАбз = ТабДок.Область("R" + Формат(СтрокаТекущая, "ЧГ=0") + "C1:R" + Формат(СтрокаТекущая, "ЧГ=0") + "C4");
			ОблАбз.Объединить();
			ОблАбз.Шрифт = ШрифтТекста;
			ОблАбз.ГоризонтальноеПоложение = ГоризонтальноеПоложение.ПоШирине;
			ОблАбз.ВертикальноеПоложение = ВертикальноеПоложение.Верх;
			ОблАбз.РазмещениеТекста = ТипРазмещенияТекстаТабличногоДокумента.Переносить;
			ОблАбз.Текст = "    " + АбзацТекст;
			ДлинаАбз = СтрДлина(АбзацТекст);
			ВысотаАбз = Макс(26, Цел((ДлинаАбз / 85) + 1) * 18);
			ТабДок.Область("R" + Формат(СтрокаТекущая, "ЧГ=0")).ВысотаСтроки = ВысотаАбз;
			СтрокаТекущая = СтрокаТекущая + 1;
		КонецЕсли;
	КонецЦикла;

	// Строка назначения характеристики («Характеристика дана по месту требования.»)
	СтрокаТекущая = СтрокаТекущая + 1;
	ТекстМеста = "Характеристика дана по месту требования.";
	Если ЗначениеЗаполнено(ДокументСсылка.АдресатВыдачи) Тогда
		ФормАдр = СокрЛП(ДокументСсылка.АдресатВыдачи.ФормулировкаВПодвале);
		Если ЗначениеЗаполнено(ФормАдр) Тогда
			ТекстМеста = ФормАдр;
		КонецЕсли;
	КонецЕсли;
	ОблМеста = ТабДок.Область("R" + Формат(СтрокаТекущая, "ЧГ=0") + "C1:R" + Формат(СтрокаТекущая, "ЧГ=0") + "C4");
	ОблМеста.Объединить();
	ОблМеста.Шрифт = ШрифтТекста;
	ОблМеста.ГоризонтальноеПоложение = ГоризонтальноеПоложение.ПоШирине;
	ОблМеста.РазмещениеТекста = ТипРазмещенияТекстаТабличногоДокумента.Переносить;
	ОблМеста.Текст = "    " + ТекстМеста;
	ТабДок.Область("R" + Формат(СтрокаТекущая, "ЧГ=0")).ВысотаСтроки = 32;

	// Блок подписей: Старший педагог дополнительного образования и Куратор
	СтрокаПодп1 = СтрокаТекущая + 2;
	ФИОСтаршего = "Ф.Х. Хаматнурова";
	Если ЗначениеЗаполнено(ДокументСсылка.СтаршийПедагогДопОбразования) Тогда
		ФИОСтаршего = СокрЛП(ДокументСсылка.СтаршийПедагогДопОбразования.КраткоеФИО);
	КонецЕсли;
	ФИОКуратора = "А.Г. Латыпов";
	Если ЗначениеЗаполнено(ДокументСсылка.Куратор) Тогда
		ФИОКуратора = СокрЛП(ДокументСсылка.Куратор.КраткоеФИО);
	КонецЕсли;

	ОблДолж1 = ТабДок.Область("R" + Формат(СтрокаПодп1, "ЧГ=0") + "C1:R" + Формат(СтрокаПодп1, "ЧГ=0") + "C3");
	ОблДолж1.Объединить();
	ОблДолж1.Шрифт = ШрифтПодписи;
	ОблДолж1.Текст = "Старший педагог дополнительного образования";

	ОблФИО1 = ТабДок.Область("R" + Формат(СтрокаПодп1, "ЧГ=0") + "C4:R" + Формат(СтрокаПодп1, "ЧГ=0") + "C4");
	ОблФИО1.Шрифт = ШрифтПодписи;
	ОблФИО1.ГоризонтальноеПоложение = ГоризонтальноеПоложение.Право;
	ОблФИО1.Текст = ФИОСтаршего;
	ТабДок.Область("R" + Формат(СтрокаПодп1, "ЧГ=0")).ВысотаСтроки = 22;

	СтрокаПодп2 = СтрокаПодп1 + 1;
	ОблДолж2 = ТабДок.Область("R" + Формат(СтрокаПодп2, "ЧГ=0") + "C1:R" + Формат(СтрокаПодп2, "ЧГ=0") + "C3");
	ОблДолж2.Объединить();
	ОблДолж2.Шрифт = ШрифтПодписи;
	ОблДолж2.Текст = "Куратор:";

	ОблФИО2 = ТабДок.Область("R" + Формат(СтрокаПодп2, "ЧГ=0") + "C4:R" + Формат(СтрокаПодп2, "ЧГ=0") + "C4");
	ОблФИО2.Шрифт = ШрифтПодписи;
	ОблФИО2.ГоризонтальноеПоложение = ГоризонтальноеПоложение.Право;
	ОблФИО2.Текст = ФИОКуратора;
	ТабДок.Область("R" + Формат(СтрокаПодп2, "ЧГ=0")).ВысотаСтроки = 22;

	Возврат ТабДок;
КонецФункции
