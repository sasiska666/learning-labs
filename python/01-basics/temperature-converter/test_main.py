import unittest
from main import convert


class TestConvert(unittest.TestCase):
    def test_known_values(self):
        self.assertAlmostEqual(convert(100, "C", "F"), 212)
        self.assertAlmostEqual(convert(0, "C", "K"), 273.15)
        self.assertAlmostEqual(convert(32, "F", "C"), 0)

    def test_below_absolute_zero(self):
        with self.assertRaises(ValueError):
            convert(-300, "C", "K")


if __name__ == "__main__":
    unittest.main()
