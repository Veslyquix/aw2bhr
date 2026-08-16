	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08046E48
sub_08046E48: @ 0x08046E48
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r0, _08046EF8 @ =gUnknown_03001FF8
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08046EFC @ =gUnknown_03001418
	strh r1, [r0]
	movs r0, #0
	bl sub_0801B780
	bl sub_08022A34
	ldr r0, _08046F00 @ =gUnknown_08499580
	ldr r0, [r0]
	ldr r5, _08046F04 @ =gUnknown_0812A11C
	ldr r1, [r5]
	ldrb r1, [r1]
	lsrs r1, r1, #3
	ldr r3, _08046F08 @ =gUnknown_0812AF68
	ldr r2, _08046F0C @ =0x00008360
	str r2, [sp]
	movs r2, #0
	bl sub_08071948
	bl sub_08013B0C
	bl sub_0801F114
	ldr r4, _08046F10 @ =0x06010000
	movs r2, #0xfd
	lsls r2, r2, #1
	movs r0, #0
	adds r1, r4, #0
	movs r3, #0x16
	bl sub_0801F150
	movs r0, #0x1c
	bl sub_0801F234
	movs r0, #0x1d
	bl sub_0801F234
	movs r0, #0x1e
	bl sub_0801F234
	movs r0, #0x1f
	bl sub_0801F234
	movs r0, #0x21
	bl sub_0801F234
	movs r0, #0x20
	bl sub_0801F234
	movs r0, #0x22
	bl sub_0801F234
	movs r0, #0x2c
	bl sub_0801F234
	movs r0, #0x2d
	bl sub_0801F234
	movs r0, #0x2e
	bl sub_0801F234
	movs r0, #0x39
	bl sub_0801F234
	ldr r2, _08046F14 @ =0x0000027E
	movs r0, #2
	adds r1, r4, #0
	movs r3, #0x11
	bl sub_0801F150
	movs r0, #0xa8
	bl sub_0801F234
	ldr r1, _08046F18 @ =gUnknown_0812A120
	ldr r0, [r1]
	ldrb r2, [r0]
	adds r6, r1, #0
	cmp r2, #6
	beq _08046F20
	cmp r2, #8
	bne _08046F40
	ldr r2, _08046F1C @ =gUnknown_0849982C
	b _08046F22
	.align 2, 0
_08046EF8: .4byte gUnknown_03001FF8
_08046EFC: .4byte gUnknown_03001418
_08046F00: .4byte gUnknown_08499580
_08046F04: .4byte gUnknown_0812A11C
_08046F08: .4byte gUnknown_0812AF68
_08046F0C: .4byte 0x00008360
_08046F10: .4byte 0x06010000
_08046F14: .4byte 0x0000027E
_08046F18: .4byte gUnknown_0812A120
_08046F1C: .4byte gUnknown_0849982C
_08046F20:
	ldr r2, _08046F38 @ =gUnknown_084998A4
_08046F22:
	ldr r0, _08046F3C @ =gUnknown_02028DD7
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	ldr r3, [r1]
	adds r2, #4
	adds r0, r0, r2
	ldr r4, [r0]
	b _08046F52
	.align 2, 0
_08046F38: .4byte gUnknown_084998A4
_08046F3C: .4byte gUnknown_02028DD7
_08046F40:
	ldr r0, _08046FA8 @ =gUnknown_085D583C
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r2, r1, r0
	ldr r3, [r2]
	adds r0, #4
	adds r1, r1, r0
	ldr r4, [r1]
_08046F52:
	ldr r1, _08046FAC @ =0x060148E0
	adds r0, r3, #0
	bl sub_08011CAC
	movs r1, #0x98
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x60
	bl sub_08013618
	ldr r4, _08046FB0 @ =gUnknown_0812C024
	ldr r1, _08046FB4 @ =0x06014EE0
	adds r0, r4, #0
	movs r2, #0x60
	bl sub_08011C68
	adds r0, r4, #0
	adds r0, #0x20
	ldr r1, _08046FB8 @ =0x06014F40
	movs r2, #0x40
	bl sub_08011C68
	adds r4, #0x60
	ldr r1, _08046FBC @ =0x06014F80
	adds r0, r4, #0
	movs r2, #0x20
	bl sub_08011C68
	ldr r1, _08046FC0 @ =0x06014FA0
	adds r0, r4, #0
	movs r2, #0x20
	bl sub_08011C68
	ldr r0, _08046FC4 @ =gUnknown_02028DD4
	ldrb r0, [r0]
	cmp r0, #1
	beq _08047014
	cmp r0, #1
	bgt _08046FC8
	cmp r0, #0
	beq _08046FCE
	b _0804705C
	.align 2, 0
_08046FA8: .4byte gUnknown_085D583C
_08046FAC: .4byte 0x060148E0
_08046FB0: .4byte gUnknown_0812C024
_08046FB4: .4byte 0x06014EE0
_08046FB8: .4byte 0x06014F40
_08046FBC: .4byte 0x06014F80
_08046FC0: .4byte 0x06014FA0
_08046FC4: .4byte gUnknown_02028DD4
_08046FC8:
	cmp r0, #2
	beq _0804702A
	b _0804705C
_08046FCE:
	ldr r4, [r5]
	ldrb r0, [r4]
	ldr r5, [r6]
	ldrb r1, [r5]
	bl sub_08046914
	bl sub_08014878
	ldrb r0, [r4]
	lsrs r0, r0, #3
	adds r0, #1
	ldr r1, _0804700C @ =gUnknown_08499578
	ldr r2, [r1]
	ldr r4, _08047010 @ =gUnknown_085D583C
	ldrb r3, [r5]
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r3, [r1, #0xe]
	movs r1, #0x80
	lsls r1, r1, #8
	str r1, [sp]
	movs r1, #0x80
	lsls r1, r1, #1
	str r1, [sp, #4]
	movs r1, #0xb
	bl sub_08014668
	b _0804705C
	.align 2, 0
_0804700C: .4byte gUnknown_08499578
_08047010: .4byte gUnknown_085D583C
_08047014:
	ldr r5, [r5]
	ldrb r0, [r5]
	ldr r4, [r6]
	ldrb r1, [r4]
	bl sub_08046914
	ldrb r0, [r5]
	ldrb r1, [r4]
	bl sub_08046778
	b _0804705C
_0804702A:
	bl sub_08014878
	ldr r0, [r5]
	ldrb r0, [r0]
	lsrs r0, r0, #3
	adds r0, #1
	ldr r1, _08047070 @ =gUnknown_08499578
	ldr r2, [r1]
	ldr r4, _08047074 @ =gUnknown_085D583C
	ldr r1, [r6]
	ldrb r3, [r1]
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r3, [r1, #0xe]
	movs r1, #0x80
	lsls r1, r1, #8
	str r1, [sp]
	movs r1, #0x80
	lsls r1, r1, #1
	str r1, [sp, #4]
	movs r1, #0xb
	bl sub_08014668
_0804705C:
	bl sub_0802465C
	movs r0, #0x65
	bl sub_0803B4DC
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08047070: .4byte gUnknown_08499578
_08047074: .4byte gUnknown_085D583C

