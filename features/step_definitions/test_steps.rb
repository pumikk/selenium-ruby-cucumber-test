Given(/^Открываю в браузере "(.*)"$/) do |el|
    @driver.get(el)
    @driver.manage().window().maximize()
end

When(/^Нажимаю на "(.*)"$/) do |el|
    el = @driver.find_element(xpath: $press[el])
    el if el && el.displayed?
    el.click
end

And(/^Ввожу в поле "(.*)" значение "(.*)"$/) do |el, text|
    el = @driver.find_element(xpath: $press[el])
    el if el && el.displayed?
    el.send_keys(text)
    sleep 5
end

Then(/^Запоминаем значение из поля "(.*)"$/) do |el|
    el = @driver.find_element(xpath: $press[el])
    el if el && el.displayed?
    $field = el["title"].to_s
    puts $field
end

And(/^Проверяем наличие последнее созраненное значение$/) do
    el = @driver.find_element(xpath: "//*[text() = '" + $field + "']")
    el if el && el.displayed?
end

When(/^Переходим на текущую вкладку$/) do
    @driver.switch_to.window(@driver.window_handles.last)
end

When(/^Закрываем вкладку$/) do
    @driver.execute_script("window.close()")
end