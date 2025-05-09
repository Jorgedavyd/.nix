from sympy import Symbol, Function
from modulus.sym.geometry.primitives import VectorField
from modulus.eq.pdes import PDE
from modulus.key import Key

class CustomPDE(PDE):
    def __init__(self) -> None:
        super().__init__()
        r = Symbol("r")
        t = Symbol("t")
        input = {"r": r, "t": t}
        E = VectorField("E", 3)(*input)
        B = VectorField("B", 3)(*input)
        self.equations = dict(
                ElectrostaticGauss = E.laplace(),
                MagneticGauss = B.div(),
                Faraday = E.rot() + B.diff(t)
            )
