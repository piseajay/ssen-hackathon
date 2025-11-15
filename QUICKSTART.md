# 🚀 Quick Start Guide

## ✅ Your Application is Now Running!

### Services Status:
- ✅ **Backend (Python Flask)**: http://localhost:5000
- ✅ **Frontend (React)**: http://localhost:5173

### 📝 Important Next Steps:

1. **Add Your NERDA Token**
   
   Edit: `/Users/ajaypise/workspace/ssen-hackpompey/backend/app.py`
   
   Find line 8 and replace `<TOKEN>` with your actual token from:
   https://nerda.ssen.co.uk/nerda
   
   ```python
   NERDA_TOKEN = "your-actual-token-here"
   ```

2. **Restart Backend** (if you added the token)
   - Press `Ctrl+C` in the backend terminal
   - Run: `cd backend && venv/bin/python app.py`

### 🎯 What You're Seeing Now:

The dashboard is displaying **mock data** until you add your NERDA token. This allows you to see the full UI functionality:

- **Voltage Stability Gauge** - Shows network health score (0-100%)
- **Peak Demand Risk Indicator** - Color-coded risk levels (LOW/MEDIUM/HIGH)
- **Live Metrics** - Mean voltage, standard deviation, min/max ranges
- **Auto-refresh** - Updates every 30 seconds

### 🔧 If You See Errors:

**"Error connecting to backend"**
- Make sure Python backend is running on port 5000
- Check terminal for backend errors
- Verify Flask dependencies are installed

**"CORS Error"**
- Backend includes CORS headers, should work automatically
- Try restarting both frontend and backend

**Port Already in Use**
```bash
# Kill process on port 5000
lsof -ti:5000 | xargs kill -9

# Kill process on port 5173  
lsof -ti:5173 | xargs kill -9
```

### 📊 Testing the Dashboard:

1. **Voltage Stability Score**
   - 90-100% = Green/Excellent (network stable)
   - 70-90% = Yellow/Moderate (watch closely)
   - <70% = Red/Low (action needed)

2. **Peak Demand Risk**
   - 🟢 LOW = Normal operation
   - 🟡 MEDIUM = Elevated demand
   - 🔴 HIGH = Critical network stress

3. **Real-time Updates**
   - Dashboard refreshes every 30 seconds
   - Timestamp shows last update time
   - Charts animate when data changes

### 🎨 Customization Ideas:

1. **Add Time-Series Charts**
   - Show voltage trends over time
   - Display hourly/daily patterns
   - Compare multiple substations

2. **Add Map View**
   - Geographical visualization
   - Color-code by risk level
   - Interactive substation selection

3. **Add Alerts**
   - Browser notifications for critical events
   - Email/SMS integration
   - Custom threshold settings

4. **Add Export Features**
   - PDF reports generation
   - CSV data export
   - Shareable dashboard links

### 📱 Mobile Responsive:

The dashboard works on mobile devices! The Material-UI Grid system automatically adapts the layout.

### 🛠️ Development Commands:

```bash
# Frontend (React)
cd SSEN-React-Starter-Kit
pnpm dev          # Start dev server
pnpm build        # Build for production
pnpm preview      # Preview production build

# Backend (Python)
cd backend
venv/bin/python app.py        # Start server
venv/bin/pip install <package> # Add new package
```

### 📖 Full Documentation:

See `PROJECT_README.md` for complete documentation including:
- Architecture details
- API endpoints
- Technology stack
- Troubleshooting guide
- Future enhancement ideas

### 🎉 You're All Set!

Your SSEN Network Voltage Stability Monitor is ready to help visualize power grid issues for non-technical audiences. The dashboard makes invisible network problems visible and understandable.

**Next**: Add your NERDA token to see real live data from the network!
