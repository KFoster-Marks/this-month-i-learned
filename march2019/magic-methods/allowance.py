class DailyAllowanceLog:
    def __init__(self, kid, day):
        self.kid = kid
        self.day = day
        self.total = 0

    def __add__(self, other):
        """Function to spoil favorite kid without other kid knowing
        """
        if self.kid == 'Kristen':
            total = self.total + other.total + 0.25
        else:
            total = self.total + other.total

        return total

    def addTask(self, task, charge):
        self.total = self.total + charge
        print('{} earned ${} for doing {} on {}.'.format(self.kid, charge, task, self.day))

# Sunday
allowance_k_sunday = DailyAllowanceLog('Kristen', 'Sunday')
allowance_j_sunday = DailyAllowanceLog('Jennie', 'Sunday')

allowance_k_sunday.addTask('dishes', 1.5)
allowance_j_sunday.addTask('dishes', 1.5)

#Tuesday
allowance_k_tuesday = DailyAllowanceLog('Kristen', 'Tuesday')
allowance_j_tuesday = DailyAllowanceLog('Jennie', 'Tuesday')

allowance_k_tuesday.addTask('bathroom cleaning', 1)
allowance_j_tuesday.addTask('bathroom cleaning', 1)

print('Kristen\'s Total Allowance: ', allowance_k_sunday + allowance_k_tuesday)
print('Jennie\'s Total Allowance: ', allowance_j_sunday + allowance_j_tuesday)
