	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080319AC
sub_080319AC: @ 0x080319AC
	push {r4, lr}
	ldr r0, _080319EC @ =gUnknown_0849B060
	ldr r1, [r0]
	movs r0, #2
	strh r0, [r1, #2]
	ldr r0, _080319F0 @ =gUnknown_03004008
	ldr r2, [r0]
	movs r0, #0xf
	ands r2, r0
	ldr r4, _080319F4 @ =gUnknown_08090D0C
	cmp r2, #0
	bne _080319DA
	ldr r0, _080319F8 @ =gUnknown_02025760
	movs r1, #0xab
	strb r1, [r0]
	ldr r1, [r4]
	ldr r1, [r1]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r2, [r0, #2]
	movs r1, #0x84
	bl sub_0802F588
_080319DA:
	ldr r0, [r4]
	ldr r0, [r0]
	ldr r1, _080319FC @ =gUnknown_03003F1C
	ldrb r2, [r0, #9]
	ldrb r0, [r1]
	cmp r2, r0
	beq _08031A00
	movs r0, #1
	b _08031A10
	.align 2, 0
_080319EC: .4byte gUnknown_0849B060
_080319F0: .4byte gUnknown_03004008
_080319F4: .4byte gUnknown_08090D0C
_080319F8: .4byte gUnknown_02025760
_080319FC: .4byte gUnknown_03003F1C
_08031A00:
	ldr r1, _08031A18 @ =gUnknown_0300410C
	ldr r0, _08031A1C @ =gUnknown_030040CC
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08031A20 @ =gUnknown_030044C4
	movs r0, #0
	strb r0, [r1]
	movs r0, #0
_08031A10:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08031A18: .4byte gUnknown_0300410C
_08031A1C: .4byte gUnknown_030040CC
_08031A20: .4byte gUnknown_030044C4

