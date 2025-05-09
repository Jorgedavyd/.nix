from modulus.sym.models.arch import Arch
from modulus.sym.key import Key
from modulus.sym.hydra import ModulusConfig
from lightorch.nn import DeepNeuralNetwork
from typing import Dict
import torch

class PhysicsInformedModel(Arch):
    def __init__(
        self,
        input_keys=[Key("k"), Key("x"), Key("y")],
        output_keys=[Key("k_prime"), Key("u")],
        cfg: ModulusConfig
    ):
        super().__init__(
            input_keys=input_keys,
            output_keys=output_keys,
        )
        self.model = DeepNeuralNetwork(
            cfg.model.in_features,
            cfg.model.hidden_features,
            cfg.model.activations
        )


    def forward(self, dict_tensor: Dict[str, torch.Tensor]):
        xy_input_shape = dict_tensor["x"].shape
        xy = self.concat_input(
            {
                k: dict_tensor[k].view(xy_input_shape[0], -1, 1) for k in ["x", "y"]
            },
            ["x", "y"],
            detach_dict=self.detach_key_dict,
            dim=-1,
        )

        out = self.model(xy)

        return self.split_output(
            out, self.output_key_dict, dim=1
        )
