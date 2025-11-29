# Medical AI Agent

A comprehensive intelligent medical assistant system based on FastAPI and uni-app, providing multiple AI-powered medical functions - **completely free to use**.

## 🚀 Features

- **Smart Medical Consultation**: AI medical assistant providing professional health advice
- **Intelligent Triage**: Symptom-based department recommendation
- **Symptom Self-Diagnosis**: Disease analysis and treatment suggestions
- **Report Interpretation**: Medical examination report analysis
- **Dermatology Consultation**: Image-based skin condition analysis
- **Case Management**: Structured medical record generation
- **Health Education**: Medical knowledge and health information
- **Medication Guidance**: Drug consultation and safety reminders

## 🏗️ Technology Stack

### Backend (FastAPI)
- **Framework**: FastAPI + Python 3.8+
- **AI Model**: Alibaba Cloud Bailian (Dashscope)
  - Text Model: qwen3-max
  - Vision Model: qwen3-vl-plus
- **API**: RESTful API design
- **File Processing**: Support for DOCX, PDF, and image files

### Frontend (uni-app)
- **Framework**: uni-app + Vue 3
- **UI Library**: uview-plus
- **Build Tool**: Vite
- **Styling**: SCSS
- **State Management**: Pinia

## 📦 Installation & Deployment

### Backend Deployment

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/Medical_AI_Agent.git
cd Medical_AI_Agent
```

2. **Install dependencies**
```bash
pip install -r requirements.txt
```

3. **Configure environment**
```bash
# Edit config.py and add your API key
# Set DASHSCOPE_API_KEY = "your-api-key"
```

4. **Start the service**
```bash
python run.py
```

The service will be available at `http://localhost:8000`

### Frontend Deployment

1. **Navigate to frontend directory**
```bash
cd frontend
```

2. **Install dependencies**
```bash
npm install
```

3. **Development mode**
```bash
npm run dev:h5
```

4. **Production build**
```bash
npm run build:h5
```

## 🔧 Configuration

### Backend Configuration (config.py)

```python
# Alibaba Cloud Bailian API Configuration
DASHSCOPE_API_KEY = "your-api-key"
DASHSCOPE_BASE_URL = "https://dashscope.aliyuncs.com/compatible-mode/v1"
TEXT_MODEL = "qwen3-max"
VISION_MODEL = "qwen3-vl-plus"

# Server Configuration
HOST = "0.0.0.0"
PORT = 8000
DEBUG = True
```

### Frontend Configuration (frontend/src/api/index.js)

```javascript
// API Base URL Configuration
const API_BASE_URL = process.env.NODE_ENV === 'development' 
  ? 'http://127.0.0.1:8000' 
  : 'https://your-domain.com'
```

## 📚 API Documentation

After starting the backend service, visit `http://localhost:8000/docs` to view the interactive API documentation.

### Main Endpoints

- **POST /api/medical-chat** - Smart medical consultation (main entry point)
  - Automatic intent recognition
  - Routes to appropriate agent (triage/diagnosis/case generation/chat)
  
- **POST /api/report-interpretation** - Report interpretation
  - Upload: Word/PDF documents
  - Returns: Professional medical report analysis
  
- **POST /api/health-education** - Health education
  - Input: Health-related questions
  - Returns: Authoritative medical knowledge
  
- **POST /api/dermatology-consultation** - Dermatology consultation
  - Upload: Skin condition images
  - Optional: Symptom description
  - Returns: Image analysis and diagnostic suggestions
  
- **POST /api/medication-consultation** - Medication consultation
  - Input: Drug-related questions
  - Returns: Usage guidelines and safety information

## 🤖 AI Agent Architecture

The system includes 9 specialized AI agents:

1. **Intent Recognition Agent** - Identifies user intent and routes to appropriate agent
2. **Chat Agent** - Handles non-medical conversations
3. **Triage Agent** - Recommends appropriate medical departments
4. **Self-Diagnosis Agent** - Analyzes symptoms and provides diagnostic suggestions
5. **Case Generation Agent** - Creates structured medical records
6. **Report Interpretation Agent** - Interprets medical examination reports
7. **Health Education Agent** - Provides medical knowledge and health information
8. **Dermatology Agent** - Analyzes skin conditions from images
9. **Medication Agent** - Provides drug consultation and guidance

## 📱 Frontend Features

### Pages
- **Home** - Feature navigation and usage statistics
- **Chat** - Smart medical consultation interface
- **Reports** - Document upload and interpretation results
- **Health** - Health knowledge search and popular topics
- **Dermatology** - Image upload and symptom description
- **Medication** - Drug information queries
- **History** - Categorized viewing and data management
- **Profile** - User settings and statistics

### State Management
- **Chat Store** - Message records and session management
- **History Store** - Categorized storage and search filtering
- **User Store** - Personal information and preferences

## 💡 Key Features

### Free to Use
All features are **completely free** with no payment requirements. The payment system has been removed to ensure accessibility for all users.

### Multi-Modal Support
- Text-based medical consultation
- Image analysis for skin conditions
- Document processing for medical reports

### Privacy & Security
- Anonymous consultation supported
- Local data storage
- No sensitive information uploaded

### Cross-Platform
- WeChat Mini Program
- H5 Web App
- Mobile App (iOS/Android)

## 🎨 UI Design

### Medical Theme Colors
- **Primary**: #1658FF (Medical Blue)
- **Success**: #28a745 (Health Green)
- **Warning**: #ffc107 (Attention Yellow)
- **Danger**: #dc3545 (Alert Red)

### Design Principles
- Card-based layout for clear information hierarchy
- Rounded corners for a gentle medical feel
- Shadow layers to highlight important information
- Responsive design for multiple devices

## 🔒 Important Disclaimers

1. **Not a Medical Professional**: This AI system provides reference information only and should not replace professional medical advice.
2. **Emergency Situations**: For urgent medical conditions, please seek immediate professional medical attention.
3. **Information Accuracy**: While we strive for accuracy, medical information may not be complete or up-to-date.
4. **Privacy**: User data is stored locally; ensure proper data backup.

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Contact

For questions or suggestions, please:
- Submit an Issue
- Email: support@medical-ai.example.com

## 🙏 Acknowledgments

Thanks to the following open-source projects:
- [FastAPI](https://fastapi.tiangolo.com/) - Modern Python web framework
- [uni-app](https://uniapp.dcloud.net.cn/) - Cross-platform application framework
- [uview-plus](https://www.uviewui.com/) - UI component library
- [Alibaba Cloud Bailian](https://dashscope.aliyun.com/) - AI model platform

## 🔮 Future Roadmap

### Short-term
- Performance optimization (caching, image compression)
- Voice input support
- Push notifications
- User behavior analytics

### Long-term
- Integration with more specialized AI models
- Multi-language support
- IoT device integration
- Real medical institution data integration

---

**Project Goal**: To provide accessible, professional, and safe AI-powered medical consultation services for everyone, completely free of charge.

**Version**: 1.0.0

**Status**: Active Development

