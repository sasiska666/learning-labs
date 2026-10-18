import unittest
from main import count_words


class TestCount(unittest.TestCase):
    def test_counts_case_insensitive(self):
        c = count_words("Python python PYTHON мир Мир")
        self.assertEqual(c["python"], 3)
        self.assertEqual(c["мир"], 2)


if __name__ == "__main__":
    unittest.main()
