	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035760
sub_08035760: @ 0x08035760
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r3, r1, #0
	movs r2, #0
	adds r4, r5, #0
	adds r4, #0x4c
_0803576C:
	adds r1, r4, r2
	ldrb r0, [r3]
	strb r0, [r1]
	adds r3, #1
	adds r2, #1
	cmp r2, #0xf
	ble _0803576C
	adds r1, r5, #0
	adds r1, #0x34
	movs r0, #0
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	ldr r0, _080357D4 @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803579A
	ldr r0, _080357D8 @ =gUnknown_030032D8
	ldrh r0, [r0]
	cmp r0, #0x13
	beq _080357C0
_0803579A:
	adds r0, r5, #0
	adds r0, #0x42
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _080357A8
	adds r0, #0xf
_080357A8:
	asrs r2, r0, #4
	adds r0, r5, #0
	adds r0, #0x44
	movs r3, #0
	ldrsh r1, [r0, r3]
	cmp r1, #0
	bge _080357B8
	adds r1, #0xf
_080357B8:
	asrs r1, r1, #4
	adds r0, r2, #0
	bl sub_08029088
_080357C0:
	ldr r1, _080357DC @ =gUnknown_030040E4
	movs r0, #1
	strh r0, [r1]
	adds r0, r5, #0
	bl sub_08035F68
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080357D4: .4byte gUnknown_03003FC0
_080357D8: .4byte gUnknown_030032D8
_080357DC: .4byte gUnknown_030040E4

