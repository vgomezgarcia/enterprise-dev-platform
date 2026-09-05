#!/bin/bash -xe

# ============================================================
# VARIABLES
# Estas dos variables serán reemplazadas por CloudFormation
# ============================================================

ARTIFACT_BUCKET="${ArtifactBucketName}"
RELEASE_VERSION="${ReleaseVersion}"

echo "========================================"
echo "Starting EC2 bootstrap"
echo "Bucket: ${ARTIFACT_BUCKET}"
echo "Release: ${RELEASE_VERSION}"
echo "========================================"

# ============================================================
# INSTALL REQUIRED PACKAGES
# ============================================================

dnf install -y httpd awscli

# Verify Apache exists
rpm -q httpd

# ============================================================
# DOWNLOAD APACHE CONFIGURATION
# ============================================================

aws s3 cp \
"s3://${ARTIFACT_BUCKET}/releases/${RELEASE_VERSION}/httpd.conf" \
"/etc/httpd/conf/httpd.conf"

# ============================================================
# DOWNLOAD APPLICATION
# ============================================================

aws s3 cp \
"s3://${ARTIFACT_BUCKET}/releases/${RELEASE_VERSION}/index.html" \
"/var/www/html/index.html"

# ============================================================
# VALIDATE APACHE CONFIG
# ============================================================

apachectl configtest

# ============================================================
# ENABLE APACHE AT BOOT
# ============================================================

systemctl daemon-reload

systemctl enable httpd

# Start immediately
systemctl restart httpd

# ============================================================
# VERIFY
# ============================================================

systemctl is-enabled httpd

systemctl is-active httpd

curl --fail http://localhost/

echo "========================================"
echo "Bootstrap completed successfully"
echo "========================================"