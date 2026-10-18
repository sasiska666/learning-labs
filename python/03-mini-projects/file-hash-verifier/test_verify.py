import hashlib
import os
import tempfile
import unittest
from verify import matches, sha256_file


class TestVerify(unittest.TestCase):
    def test_hash_of_known_content(self):
        with tempfile.NamedTemporaryFile(delete=False) as f:
            f.write(b"hello")
        try:
            self.assertEqual(sha256_file(f.name), hashlib.sha256(b"hello").hexdigest())
        finally:
            os.unlink(f.name)

    def test_matches_ignores_case_and_spaces(self):
        self.assertTrue(matches("ABC123", " abc123 "))
        self.assertFalse(matches("abc123", "abc124"))


if __name__ == "__main__":
    unittest.main()
