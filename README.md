# Volzhanin ESP32
## Этапы сварки: 
 1. Оплавление P/T
 2. Прогрев P/T
 3. Тех.пауза 0/T
 4. Осадка P/T
 5. Сварка P/T
 6. Сварка с пониженным давлением P/T
## Протокол обмена

### Service ID 67a4eeb9-98f1-4186-8717-df670471d68b Архив
Функция **READ** чтение архивов с текущего этапа arch_state.
Возвращает архивы сварки каждого отдельного этапа: 23.5;23.5;12.5;34.5;12.8;...34.6
Значения сохраняются в архив каждую секунду, кроме этапа Сварка и Сварка с пониженным давлением, там данные сохраняются каждые 4 секунды
Функция **WRITE** запись параметров для чтения архивов offset - смещение, arch_state - архив конкретного этапа.

Пример команды: {"offset":0,"arch_state":1}

### Service ID 4e75c6fe-d008-49f2-b182-fe231eed747c Сварка
Функция **READ** чтение текущих параметров сварки welding_param.
Возвращает текущие параметры сварки: 0;1628344812949;4.600000;0.100000;0;0;4.600000;0;0;16;5;8;20;0;0;0;0;0;0;0;"1628344812949";"1628344583754";"56.79,45.89"
Данные в порядке поступления: 
 - Номер этапа
 - ID сварки
 - Уставки давлений по этапам (6 цифр)
 - Уставки времени этапов (6 цифр)
 - Реальное время каждого этапа (6 цифр)
 - Время начала сварки
 - Время окончания сварки
 - GPS координаты

Функция **WRITE** запись параметров сварки и старт процесса.
Примеры команд: 
 - {"cmd":0, "st_n":5, "sp_p":[4.6,0.1,0.0,0.0,4.6,0.0], "st_t":[0,160,5,8,1050,0], "ts":123456789, "id":"12345678", "gps": "56.79,45.89"}, где cmd:0 - параметр для записи параметров сварки, sp_p - уставки давлений каждого этапа (обязательно с точкой), st_n - количество этапов сварки, st_t - время длительности каждого этапа в секундах, ts - время начала сварки UTC, id - уникальный ID сварки, gps - координаты местоположения
 - {"cmd":1, "state":1}, cmd:1 - параметр для перехода на следующий этап, state:1 - этап сварки.

Функция **NOTIFY** подписаться на уведомления от устройства.
 - Возвращает текущий этап сварки
 - Текущее время этапа
 - Оповещения о выходе параметров за пределы - массив из 4 типов параметров оповещения: 1-давление вне диапазона, 2-20 секунд до окончания этапы, 3-низкий заряд батареи, 4-низкая температур окр. среды
 - Давление текущее
 - Напряжение батареи 
 - Температуру окружающей среды 
 - Количество свободной оперативной памяти 
 - Текущее MTU

Пример сообщения: 1;45;0;0;0;0;23.5;4.2;12.1;108500;330

### Service ID c2232013-e3e9-4e3c-8a62-7e708dc0cbbc Обновление/Настройки
Функция **READ** чтение возвращает:
 - режима обновления
 - текущей версии прошивки 
 - режим эмулятора
 - параметры датчика давления (p_in_min, p_in_max, p_out_min, p_out_max)
Возвращает версию прошивки в формате: 1;1.2;0;4;20;0;60;
Функция **WRITE** активация режима прошивки.
Пример команды:
 - {"cmd":0, "sensors": {"p_out_min":0, "p_out_max":16, "p_in_min":4, "p_in_max":20}} cmd:0 - параметры настройки датчиков
 - {"cmd":1, "emulator": 1} cmd1 - включить эмулятор
 - {"cmd":2, "update": 1} - cmd2 - включить wi-fi и перезапустить контроллер

После установки данного параметра контроллер перезагрузится. Для обновления прошивки необходимо подключиться к точке доступа update_?????? и выполнить http_post запрос, пример curl -i -F filedata=@./build/fw.zip  http://192.168.4.1/update.

**ИНДИКАТОРЫ на панели:**
 - Индикатор ALARM моргает, когда давление не в диапазоне +-10%, горит, когда температура ниже +5 градусов по Цельсию
 - Индикатор BATTERY моргает, когда заряд батареи критический (<3.5В), горит когда подано питание 
 - Индикатор NEXT_BUTTON морагет, когда до следующего этапа осталось меньше 20 сеекунд
 - Индикатор BLUETOOTH моргает, когда включен режим обновления, горит когда подключен клиент по Bluetooth