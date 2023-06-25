#source config.sh # Put your developer ID in here using `developerID='putYourDeveloperIDHere'` (it is of the form `Apple Development: yourEmailHere (yourIDNumberOfSomeSortHere)` and can be gotten from the keychain access app on macOS)

security find-identity -v -p codesigning
# Use this to put into the "-s" arg here:
codesign --force -s "$developerID" --entitlements snapUtil.entitlements --deep snapUtil
# Now sudo ./snapUtil works!
# Disable SIP too: `csrutil disable` and `nvram boot-args= amfi_get_out_of_my_way=0x1`... maybe..: https://github.com/ahl/apfs/issues/2 : {"
# I managed to run it on Catalina with these two steps:
# 
# I added the com.apple.developer.vfs.snapshot entitlement when signing the binary. Even ad-hoc signing works.
# I rebooted to recovery and disabled SIP and AMFI with the commands csrutil disable and nvram boot-args= amfi_get_out_of_my_way=0x1.
# After booting back to macOS proper, I can run snapUtil and create and manage snapshots. You can then reenable security with csrutil enable and nvram -d boot-args.
# "}
