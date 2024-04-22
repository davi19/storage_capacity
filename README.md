# Storage Capacity [Deprecated]

Package created to facilitate the manipulation of storage space on Android and IOS. Informing the space available for use, the space occupied, the total storage space, conversion facilities to MB and GB. And ease to discover the device's GB capacity


## Usage

### Free Space
```
    var freeSpace = await StorageCapacity.getFreeSpace;
```

### Occupied Space
```
    var occupiedSpace = await StorageCapacity.getOccupiedSpace;
```
### Total Space
```
    var totalSpace = await StorageCapacity.getTotalSpace;
```
### Conversions
```
    StorageCapacity.toGigaBytes(double.parse(totalSpace.toString()));
    StorageCapacity.toMegaBytes(double.parse(totalSpace.toString()));
```
### Search Capacity
```
    dynamic totalSpace = await StorageCapacity.getTotalSpace;
    totalSpace = StorageCapacity.toGigaBytes(double.parse(totalSpace.toString()));
    totalSpace = StorageCapacity.searchCapacity(double.parse(totalSpace));
```


