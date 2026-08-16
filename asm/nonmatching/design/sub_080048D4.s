	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080048D4
sub_080048D4: @ 0x080048D4
	push {r4, lr}
	bl sub_08011B18
	ldr r2, _08004920 @ =gUnknown_03001470
	ldr r0, _08004924 @ =gUnknown_03001FBC
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r2
	movs r2, #0
	adds r4, r0, #0
	adds r4, #0x1e
	ldr r3, _08004928 @ =gUnknown_0200B0B0
_080048F2:
	adds r1, r4, r2
	ldr r0, [r3]
	adds r0, #0x9c
	adds r0, r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, [r3]
	adds r1, r0, #0
	adds r1, #0x9c
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _08004912
	adds r2, #1
	cmp r2, #0x12
	ble _080048F2
_08004912:
	adds r0, r1, #0
	movs r1, #8
	bl sub_0804B10C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08004920: .4byte gUnknown_03001470
_08004924: .4byte gUnknown_03001FBC
_08004928: .4byte gUnknown_0200B0B0

