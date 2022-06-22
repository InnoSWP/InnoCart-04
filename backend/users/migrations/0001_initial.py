# Generated by Django 4.0.4 on 2022-06-17 10:44

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('passwordMd5hash', models.CharField(blank=True, max_length=300, null=True)),
                ('name', models.CharField(max_length=100)),
                ('phoneNumber', models.CharField(max_length=20)),
                ('email', models.CharField(max_length=200)),
                ('age', models.IntegerField()),
                ('deliveryRate', models.DecimalField(decimal_places=1, default=0, max_digits=1000)),
                ('createdOrdersHistoryIds', models.JSONField(blank=True, null=True)),
                ('deliveredOrdersHistoryIds', models.JSONField(blank=True, null=True)),
            ],
        ),
    ]