# Generated by Django 4.2.4 on 2024-09-21 13:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0003_alter_order_order_id_alter_order_payment_id_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='fooditem',
            name='in_stock',
            field=models.BooleanField(default=True),
        ),
    ]
