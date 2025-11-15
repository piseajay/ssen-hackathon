# ⚡ SSEN Network Voltage Stability Monitor

A real-time visualization dashboard for monitoring electricity network voltage stability and peak demand issues. Built for the SSEN Hackathon to make invisible power grid problems visible to non-technical audiences.

## 🎯 Features

- **Real-time Voltage Stability Monitoring** - Visualize network health with an interactive gauge
- **Peak Demand Risk Assessment** - Color-coded alerts for network stress levels
- **Live Metrics Dashboard** - Track voltage fluctuations and demand patterns
- **Auto-refresh** - Data updates every 30 seconds
- **Responsive Design** - Works on desktop and mobile devices

## 🏗️ Architecture

- **Frontend**: React + TypeScript + Material-UI + MUI Charts
- **Backend**: Python Flask API for data processing
- **Data Source**: SSEN NERDA API

## 🚀 Getting Started

### Prerequisites

- Node.js (v18+)
- Python (v3.8+)
- pnpm (or npm)
- NERDA API token from https://nerda.ssen.co.uk/nerda

### Installation

1. **Install Frontend Dependencies**

```bash
cd SSEN-React-Starter-Kit
pnpm install
```

2. **Install Backend Dependencies**

```bash
cd ../backend
pip install -r requirements.txt
```

3. **Configure NERDA Token**

Edit `backend/app.py` and add your token:
```python
NERDA_TOKEN = "your-token-here"
```

### Running the Application

1. **Start the Python Backend** (Terminal 1)

```bash
cd backend
python app.py
```

Backend will run on http://localhost:5000

2. **Start the React Frontend** (Terminal 2)

```bash
cd SSEN-React-Starter-Kit
pnpm dev
```

Frontend will run on http://localhost:5173

3. **Open your browser** to http://localhost:5173

## 📊 What The Dashboard Shows

### Voltage Stability Score (0-100%)
- **90-100%**: Excellent - Network operating smoothly
- **70-90%**: Moderate - Monitor for potential issues  
- **<70%**: Low - Action may be required

### Peak Demand Risk Levels
- 🟢 **LOW**: Peak/Average ratio < 1.2x - Normal operation
- 🟡 **MEDIUM**: Peak/Average ratio 1.2-1.5x - Watch closely
- 🔴 **HIGH**: Peak/Average ratio > 1.5x - Network stress

### Voltage Metrics
- **Mean Voltage**: Average voltage across the network
- **Standard Deviation**: How much voltage fluctuates
- **Min/Max Range**: Voltage boundaries

## 🎨 Customization

### Add More Visualizations

The dashboard uses MUI X-Charts. You can add:
- Time-series line charts for historical trends
- Bar charts for comparing substations
- Heat maps for geographical voltage distribution

### Adjust Refresh Rate

In `App.tsx`, modify:
```typescript
refetchInterval: 30000 // Change to desired milliseconds
```

### Change Risk Thresholds

In `backend/app.py`, update the `analyze_peak_demand` function:
```python
risk_level = 'HIGH' if ratio > 1.5 else 'MEDIUM' if ratio > 1.2 else 'LOW'
```

## 🛠️ Technology Stack

- **React 19** - UI framework
- **TypeScript** - Type safety
- **Material-UI** - Component library
- **MUI X-Charts** - Data visualization
- **TanStack Query** - Data fetching
- **Flask** - Python backend
- **Flask-CORS** - Cross-origin requests

## 📝 API Endpoints

### Backend API

- `GET /api/dashboard-data` - Get processed voltage and demand data
- `GET /api/health` - Health check endpoint

### NERDA API

- `GET https://nerda-prod-apis-v2.azurewebsites.net/api/ApiNerdaStatic`
- `GET https://nerda-prod-apis-v2.azurewebsites.net/api/ApiNerdaStatic?substation={id}`

## 🐛 Troubleshooting

### Backend Connection Error
- Ensure Python backend is running on port 5000
- Check NERDA token is valid and not expired
- Verify CORS is properly configured

### Data Not Showing
- Check browser console for errors
- Verify API token has correct permissions
- Check network tab for failed requests

### Port Already in Use
```bash
# Kill process on port 5000
lsof -ti:5000 | xargs kill -9

# Kill process on port 5173
lsof -ti:5173 | xargs kill -9
```

## 🎯 Future Enhancements

- [ ] Historical data trends and time-series analysis
- [ ] Geographical map view of substations
- [ ] Email/SMS alerts for critical events
- [ ] Machine learning predictions for peak times
- [ ] Export reports as PDF
- [ ] Multi-substation comparison view
- [ ] User authentication and personalized dashboards

## 📄 License

This project was created for the SSEN Hackathon 2025.

## 🙏 Acknowledgments

- SSEN for providing the NERDA API
- Hack Pompey for organizing the hackathon
- The open-source community for amazing tools
