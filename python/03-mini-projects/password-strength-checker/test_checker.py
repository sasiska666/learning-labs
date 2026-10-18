import unittest
from checker import entropy_bits, rate


class TestChecker(unittest.TestCase):
    def test_common_password(self):
        self.assertEqual(rate("password")[0], "very weak")

    def test_short_is_not_strong(self):
        self.assertIn(rate("Ab1")[0], ("weak", "medium"))

    def test_long_mixed_is_strong(self):
        self.assertEqual(rate("c0rrect-Horse-battery-Staple!")[0], "strong")

    def test_entropy_grows_with_length(self):
        self.assertGreater(entropy_bits("abcdefgh"), entropy_bits("abcd"))


if __name__ == "__main__":
    unittest.main()
