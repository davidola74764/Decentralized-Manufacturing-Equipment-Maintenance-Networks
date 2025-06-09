# Decentralized Manufacturing Equipment Maintenance Networks

A comprehensive blockchain-based system for managing manufacturing equipment maintenance using Clarity smart contracts on the Stacks blockchain.

## Overview

This project implements a decentralized network for manufacturing equipment maintenance that includes owner verification, maintenance history tracking, service provider management, parts inventory, and performance optimization.

## Features

### 🔐 Equipment Owner Verification
- Validates manufacturing equipment owners
- Registers equipment with verified ownership
- Maintains ownership records on-chain

### 📋 Maintenance History Tracking
- Records comprehensive maintenance history
- Tracks service providers, costs, and parts used
- Maintains chronological maintenance records

### 🔧 Service Provider Management
- Registers and verifies service providers
- Manages provider ratings and specializations
- Tracks provider performance metrics

### 📦 Parts Inventory Management
- Manages maintenance parts inventory
- Tracks stock levels and suppliers
- Handles parts reservation and allocation

### 📊 Performance Optimization
- Records equipment performance metrics
- Generates optimization recommendations
- Creates and manages equipment alerts

## Smart Contracts

### Equipment Owner Verification (\`equipment-owner-verification.clar\`)
- \`verify-owner\`: Verify equipment owners
- \`register-equipment\`: Register new equipment
- \`is-owner-verified\`: Check owner verification status
- \`get-equipment-info\`: Retrieve equipment information

### Maintenance History (\`maintenance-history.clar\`)
- \`add-maintenance-record\`: Add new maintenance records
- \`get-maintenance-record\`: Retrieve maintenance records
- \`get-equipment-record-count\`: Get total maintenance records

### Service Provider (\`service-provider.clar\`)
- \`register-provider\`: Register new service providers
- \`verify-provider\`: Verify service providers
- \`rate-provider\`: Rate service provider performance
- \`get-provider-info\`: Get provider information

### Parts Inventory (\`parts-inventory.clar\`)
- \`add-part\`: Add new parts to inventory
- \`update-stock\`: Update stock levels
- \`reserve-parts\`: Reserve parts for maintenance
- \`get-part-info\`: Get part information

### Performance Optimization (\`performance-optimization.clar\`)
- \`record-performance-metrics\`: Record equipment performance
- \`create-optimization-recommendation\`: Create optimization suggestions
- \`create-alert\`: Create equipment alerts
- \`get-performance-metrics\`: Retrieve performance data

## Installation

1. Clone the repository:
   \`\`\`bash
   git clone <repository-url>
   cd manufacturing-maintenance-network
   \`\`\`

2. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

3. Run tests:
   \`\`\`bash
   npm test
   \`\`\`

## Usage

### Deploying Contracts

Deploy the contracts to the Stacks blockchain in the following order:

1. Equipment Owner Verification
2. Service Provider
3. Parts Inventory
4. Maintenance History
5. Performance Optimization

### Basic Workflow

1. **Owner Verification**: Equipment owners must be verified before registering equipment
2. **Equipment Registration**: Register manufacturing equipment with verified ownership
3. **Service Provider Setup**: Register and verify service providers
4. **Parts Management**: Add parts to inventory and manage stock levels
5. **Maintenance Tracking**: Record maintenance activities and track history
6. **Performance Monitoring**: Monitor equipment performance and generate optimization recommendations

## Testing

The project includes comprehensive tests using Vitest:

\`\`\`bash
npm test
\`\`\`

Test files cover:
- Equipment owner verification functionality
- Maintenance history tracking
- Service provider management
- Parts inventory operations
- Performance optimization features

## Error Codes

- \`u100\`: Owner only operation
- \`u101\`: Not found
- \`u102\`: Already exists / Insufficient stock
- \`u103\`: Unauthorized
- \`u104\`: Invalid rating (too high)
- \`u105\`: Invalid rating (too low)

## Data Structures

### Equipment Registry
- Equipment ID
- Owner principal
- Verification status
- Registration date

### Maintenance Records
- Equipment ID and Record ID
- Service provider
- Maintenance type and date
- Cost and parts used
- Notes

### Service Providers
- Provider principal
- Name and specialization
- Rating and total jobs
- Verification status

### Parts Inventory
- Part ID and name
- Description and category
- Supplier and quantity
- Price

### Performance Metrics
- Equipment ID and timestamp
- Efficiency and uptime
- Energy consumption
- Output quality
- Maintenance score

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## License

This project is licensed under the MIT License.

## Support

For support and questions, please open an issue in the repository.
