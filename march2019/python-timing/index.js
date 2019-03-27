from time import localtime, sleep, strftime, time

print('Current time: {}'.format(strftime("%a, %d %b %Y %H:%M", localtime())))

seconds = int(input('How many seconds would you like to wait? '))

start_time = time()
sleep(seconds)
end_time = time()
total_time = end_time - start_time

print('This program took {} seconds to run'.format(total_time))
