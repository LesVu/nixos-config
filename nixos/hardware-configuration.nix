{
  fileSystems."/srv/smbnix/tbstores" = {
    device = "/dev/disk/by-uuid/3503be00-1ca8-4ca6-8cb6-8e0656d0ebb9";
    fsType = "ext4";
    options = [
      # If you don't have this options attribute, it'll default to "defaults" 
      # boot options for fstab. Search up fstab mount options you can use
      "users" # Allows any user to mount and unmount
      "nofail" # Prevent system from failing if this drive doesn't mount

    ];
  };
}
