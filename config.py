"""
医疗智能体配置文件
"""
import os
from typing import Dict, Any

class Config:
    """配置类"""
    
    # 阿里云百炼配置
    DASHSCOPE_BASE_URL = ""
    DASHSCOPE_API_KEY = ""
    
    # 模型配置
    TEXT_MODEL = "qwen3-max"  # 文本模型
    VISION_MODEL = "qwen3-vl-plus"  # 视觉模型
    
    # 服务配置
    HOST = "0.0.0.0"
    PORT = 8000
    DEBUG = True
    
    # 文件上传配置
    MAX_FILE_SIZE = 10 * 1024 * 1024  # 10MB
    ALLOWED_FILE_TYPES = {
        "document": [".docx", ".pdf", ".txt"],
        "image": [".jpg", ".jpeg", ".png", ".bmp", ".gif"]
    }
    
    # 智能体配置
    AGENTS_CONFIG = {
        "intent_recognition": {
            "name": "意图识别智能体",
            "description": "判断用户输入是医疗意图还是非医疗用途，并分类医疗具体用途"
        },
        "chat": {
            "name": "闲聊智能体", 
            "description": "处理非医疗意图的对话"
        },
        "triage": {
            "name": "智能分诊智能体",
            "description": "根据患者病情推荐合适的科室"
        },
        "self_diagnosis": {
            "name": "症状自诊智能体",
            "description": "根据患者病情生成病情分析、诊断和处置建议"
        },
        "case_generation": {
            "name": "病例生成智能体",
            "description": "引导收集病情并整理成结构化病历"
        },
        "report_interpretation": {
            "name": "报告解读智能体",
            "description": "解读医学检查检验报告"
        },
        "health_education": {
            "name": "健康科普智能体",
            "description": "提供权威医学知识科普"
        },
        "dermatology": {
            "name": "皮肤病咨询智能体",
            "description": "分析皮肤病图片并提供诊断建议"
        },
        "medication": {
            "name": "药物咨询智能体",
            "description": "基于药品说明书提供用药指导"
        }
    }
