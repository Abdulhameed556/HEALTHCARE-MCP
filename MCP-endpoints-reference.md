# Healthcare MCP Endpoints Reference

This document lists all MCP endpoints, their parameters, and example responses for use in FastAPI or other backend integrations.

---

## 1. FDA Drug Lookup

**Endpoint:**  
- MCP: `fda_drug_lookup(drug_name: str, search_type: str = "general")`
- REST: `GET /api/fda?drug_name={drug_name}&search_type={search_type}`

**Parameters:**  
- `drug_name` (string, required): Name of the drug
- `search_type` (string, optional, default: "general"): `"general"`, `"label"`, `"adverse_events"`

**Example Response:**
```json
{
  "status": "success",
  "drug_name": "aspirin",
  "results": [
    {
      "generic_name": "ASPIRIN",
      "brand_name": "BAYER ASPIRIN",
      "manufacturer": "Bayer Healthcare",
      "product_type": "HUMAN OTC DRUG",
      "route": ["ORAL"],
      "dosage_form": "TABLET",
      "warnings": "...",
      "indications_and_usage": "...",
      "contraindications": "..."
    }
  ],
  "total_results": 3
}
```

---

## 2. PubMed Search

**Endpoint:**  
- MCP: `pubmed_search(query: str, max_results: int = 5, date_range: int = 5)`
- REST: `GET /api/pubmed?query={query}&max_results={max_results}&date_range={date_range}`

**Parameters:**  
- `query` (string, required): Search query
- `max_results` (int, optional, default: 5, max: 50)
- `date_range` (int, optional, years, default: 5)

**Example Response:**
```json
{
  "status": "success",
  "query": "diabetes treatment",
  "total_results": 123456,
  "date_range": "5",
  "articles": [
    {
      "pmid": "12345678",
      "title": "New advances in diabetes treatment",
      "authors": ["Smith J", "Johnson A"],
      "journal": "Journal of Diabetes Research",
      "publication_date": "2023-01-15",
      "abstract": "This study explores new treatment options..."
    }
  ]
}
```

---

## 3. Health Topics

**Endpoint:**  
- MCP: `health_topics(query: str, max_results: int = 10)`
- REST: `GET /api/health-topics?query={query}&max_results={max_results}`

**Parameters:**  
- `query` (string, required): Topic to search
- `max_results` (int, optional, default: 10)

**Example Response:**
```json
{
  "status": "success",
  "query": "diabetes",
  "topics": [
    {
      "title": "Diabetes Overview",
      "summary": "...",
      "source": "Health.gov"
    }
  ]
}
```

---

## 4. Clinical Trials Search

**Endpoint:**  
- MCP: `clinical_trials_search(query: str, status: str = "all", max_results: int = 10)`
- REST: `GET /api/clinical-trials?query={query}&status={status}&max_results={max_results}`

**Parameters:**  
- `query` (string, required): Search term
- `status` (string, optional, default: "all"): `"all"`, `"recruiting"`, `"completed"`
- `max_results` (int, optional, default: 10)

**Example Response:**
```json
{
  "status": "success",
  "query": "metformin",
  "trials": [
    {
      "nct_id": "NCT01234567",
      "title": "Metformin in Diabetes",
      "status": "Recruiting",
      "summary": "A study of metformin in diabetes patients..."
    }
  ]
}
```

---

## 5. Medical Terminology / ICD-10 Lookup

**Endpoint:**  
- MCP: `medical_terminology_lookup(term: str, category: str = "all")`
- REST: `GET /api/icd10?term={term}&category={category}`

**Parameters:**  
- `term` (string, required): Medical term or ICD-10 code
- `category` (string, optional): `"icd10"`, `"terminology"`, `"all"`

**Example Response:**
```json
{
  "status": "success",
  "term": "E11.9",
  "category": "icd10",
  "results": [
    {
      "code": "E11.9",
      "description": "Type 2 diabetes mellitus without complications"
    }
  ]
}
```

---

## 6. medRxiv Search

**Endpoint:**  
- MCP: `medrxiv_search(query: str, max_results: int = 10)`
- REST: `GET /api/medrxiv?query={query}&max_results={max_results}`

**Parameters:**  
- `query` (string, required)
- `max_results` (int, optional, default: 10)

**Example Response:**
```json
{
  "status": "success",
  "query": "covid-19",
  "articles": [
    {
      "title": "COVID-19 and Diabetes",
      "authors": ["Doe J", "Smith A"],
      "date": "2023-05-01",
      "abstract": "Preliminary findings on COVID-19 and diabetes..."
    }
  ]
}
```

---

## 7. Calculate BMI

**Endpoint:**  
- MCP: `calculate_bmi(weight: float, height: float)`
- REST: `GET /api/bmi?weight={weight}&height={height}`

**Parameters:**  
- `weight` (float, required): Weight in kilograms
- `height` (float, required): Height in meters

**Example Response:**
```json
{
  "status": "success",
  "weight": 70,
  "height": 1.75,
  "bmi": 22.86,
  "category": "Normal weight"
}
```

---

## 8. NCBI Bookshelf Search

**Endpoint:**  
- MCP: `ncbi_bookshelf_search(query: str, max_results: int = 10)`
- REST: `GET /api/bookshelf?query={query}&max_results={max_results}`

**Parameters:**  
- `query` (string, required)
- `max_results` (int, optional, default: 10)

**Example Response:**
```json
{
  "status": "success",
  "query": "diabetes",
  "books": [
    {
      "title": "Diabetes Mellitus",
      "authors": ["Brown T"],
      "year": 2022,
      "summary": "Comprehensive overview of diabetes..."
    }
  ]
}
```

---

## 9. Extract DICOM Metadata

**Endpoint:**  
- MCP: `extract_dicom_metadata(file_path: str)`
- REST: `POST /api/dicom/metadata` (with file upload)

**Parameters:**  
- `file_path` (string, required): Path to DICOM file

**Example Response:**
```json
{
  "status": "success",
  "file": "sample.dcm",
  "metadata": {
    "PatientName": "John Doe",
    "StudyDate": "2023-01-01",
    "Modality": "CT",
    "InstitutionName": "General Hospital"
  }
}
```

---

## 10. Usage Analytics

**Endpoint:**  
- MCP: `usage_analytics(period: str = "day", tool: str = "all")`
- REST: `GET /api/usage?period={period}&tool={tool}`

**Parameters:**  
- `period` (string, optional): `"day"`, `"week"`, `"month"`
- `tool` (string, optional): Tool name

**Example Response:**
```json
{
  "status": "success",
  "period": "week",
  "tool": "fda_drug_lookup",
  "usage": {
    "calls": 120,
    "errors": 2,
    "average_response_time_ms": 350
  }
}
```

---

## Error Response Format (All Endpoints)
```json
{
  "status": "error",
  "error_message": "Detailed error description",
  "error_code": 400
}
```

---

## Authentication (HTTP/SSE)
- Include API key in header: `X-API-Key: your_api_key_here`
