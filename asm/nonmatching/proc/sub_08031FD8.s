	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031FD8
sub_08031FD8: @ 0x08031FD8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r6, #0
	movs r4, #0
_08031FE4:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	bl sub_0802F460
	lsls r0, r0, #0x18
	adds r7, r4, #1
	cmp r0, #0
	beq _08032022
	movs r5, #0
	lsls r1, r4, #1
	ldr r2, _08032040 @ =gUnknown_02025564
	adds r1, r1, r4
	ldr r0, _08032044 @ =gUnknown_0300449C
	adds r3, r4, r0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x33
	adds r2, r0, r2
_0803200A:
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _0803201A
	adds r6, #1
	ldrb r0, [r3]
	adds r0, #1
	ldrb r1, [r3]
	strb r0, [r3]
_0803201A:
	adds r2, #0x1c
	adds r5, #1
	cmp r5, #2
	ble _0803200A
_08032022:
	adds r4, r7, #0
	cmp r4, #3
	ble _08031FE4
	cmp r6, #0
	beq _08032034
	mov r0, r8
	movs r1, #0
	bl Proc_Goto
_08032034:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032040: .4byte gUnknown_02025564
_08032044: .4byte gUnknown_0300449C

