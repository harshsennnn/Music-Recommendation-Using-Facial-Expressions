import pytest
import numpy as np
from code.main_face import predict_emotion  # adjust import based on your actual function

def test_emotion_prediction():
    # Create a dummy image for testing
    dummy_image = np.zeros((64, 64, 1), dtype=np.float32)
    
    # Test if function runs without errors
    try:
        result = predict_emotion(dummy_image)
        assert result in ['Angry', 'Disgust', 'Fear', 'Happy', 'Sad', 'Surprise', 'Neutral']
    except Exception as e:
        pytest.fail(f"Prediction failed with error: {str(e)}")