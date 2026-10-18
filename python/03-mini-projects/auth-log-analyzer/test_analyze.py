import unittest
from analyze import parse


class TestParse(unittest.TestCase):
    def test_parse_counts(self):
        with open("sample_auth.log", encoding="utf-8") as f:
            by_ip, by_user = parse(f.read().splitlines())
        self.assertEqual(by_ip["203.0.113.7"], 3)
        self.assertEqual(by_ip["198.51.100.23"], 1)
        self.assertEqual(by_user["root"], 2)
        self.assertNotIn("student", by_user)


if __name__ == "__main__":
    unittest.main()
