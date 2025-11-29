import pytest
from script.deploy import deploy_call_anything, deploy_encoding, deploy_raw_call


@pytest.fixture
def call_anything():
    return deploy_call_anything()

@pytest.fixture
def encoding():
    return deploy_encoding()

@pytest.fixture
def raw_call():
    return deploy_raw_call()