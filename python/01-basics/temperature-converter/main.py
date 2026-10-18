"""Convert temperatures between Celsius, Fahrenheit and Kelvin."""
import sys

ABS_ZERO_C = -273.15


def to_celsius(value: float, unit: str) -> float:
    unit = unit.upper()
    if unit == "C":
        c = value
    elif unit == "F":
        c = (value - 32) * 5 / 9
    elif unit == "K":
        c = value - 273.15
    else:
        raise ValueError(f"Unknown unit: {unit}")
    if c < ABS_ZERO_C - 1e-9:
        raise ValueError("Below absolute zero")
    return c


def convert(value: float, src: str, dst: str) -> float:
    c = to_celsius(value, src)
    dst = dst.upper()
    if dst == "C":
        return c
    if dst == "F":
        return c * 9 / 5 + 32
    if dst == "K":
        return c + 273.15
    raise ValueError(f"Unknown unit: {dst}")


if __name__ == "__main__":
    if len(sys.argv) != 4:
        sys.exit("Usage: python main.py VALUE FROM TO   (units: C, F, K)")
    print(round(convert(float(sys.argv[1]), sys.argv[2], sys.argv[3]), 2))
