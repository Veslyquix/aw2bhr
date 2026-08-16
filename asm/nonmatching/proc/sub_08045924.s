	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045924
sub_08045924: @ 0x08045924
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r1, _08045970 @ =gUnknown_084995FE
	ldr r0, _08045974 @ =gUnknown_03003F2C
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r3, r0, #1
	adds r4, r0, #0
	adds r4, #0x33
	cmp r3, r4
	bge _08045968
	ldr r0, _08045978 @ =gUnknown_08499594
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r2, r0, r1
	movs r6, #0x7f
	subs r3, r4, r3
_0804594E:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08045960
	ldrb r1, [r2, #6]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08045960
	adds r5, #1
_08045960:
	adds r2, #0xc
	subs r3, #1
	cmp r3, #0
	bne _0804594E
_08045968:
	cmp r5, #0
	beq _0804597C
	movs r0, #0
	b _0804597E
	.align 2, 0
_08045970: .4byte gUnknown_084995FE
_08045974: .4byte gUnknown_03003F2C
_08045978: .4byte gUnknown_08499594
_0804597C:
	movs r0, #1
_0804597E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

