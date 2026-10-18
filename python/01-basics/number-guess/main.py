"""Number guessing game with a hint after every try."""
import random


def check_guess(guess: int, secret: int) -> str:
    """Return 'low', 'high' or 'correct'."""
    if guess < secret:
        return "low"
    if guess > secret:
        return "high"
    return "correct"


def play(low: int = 1, high: int = 100) -> int:
    secret = random.randint(low, high)
    tries = 0
    print(f"I picked a number from {low} to {high}.")
    while True:
        raw = input("Your guess: ").strip()
        if not raw.lstrip("-").isdigit():
            print("Enter a whole number.")
            continue
        tries += 1
        result = check_guess(int(raw), secret)
        if result == "correct":
            print(f"Correct! Tries: {tries}")
            return tries
        print("Too low." if result == "low" else "Too high.")


if __name__ == "__main__":
    play()
