import unittest
from main import check_guess


class TestGuess(unittest.TestCase):
    def test_check_guess(self):
        self.assertEqual(check_guess(1, 5), "low")
        self.assertEqual(check_guess(9, 5), "high")
        self.assertEqual(check_guess(5, 5), "correct")


if __name__ == "__main__":
    unittest.main()
