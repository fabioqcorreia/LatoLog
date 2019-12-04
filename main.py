from logging.format import FormatLog
from utils import constants

class LatoLog:

    type = None

    def __init__(self,
                 type=constants.JSON):

        self.type = type

    def print_log(self, content):

        log = FormatLog()

        print(log.format_log(content=content,
                             type=self.type))


content = {
    "Asdfg": "asdfgasdas",
    "suadgy": 2,
    "s8dah": "asdfgasdas",
    "asdhdas": False,
    "aisdags": "asdfgasdas"
}

main = LatoLog()

main.print_log(content)
