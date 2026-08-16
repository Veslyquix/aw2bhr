	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080490BC
sub_080490BC: @ 0x080490BC
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, _08049104 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #0xc]
	movs r0, #2
	ands r0, r1
	ldr r4, _08049108 @ =gUnknown_0812A15C
	cmp r0, #0
	beq _080490E4
	bl sub_080485F8
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r0, _0804910C @ =0x0000083C
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080490E4:
	ldr r4, [r4]
	ldr r1, [r4]
	ldr r5, _08049110 @ =0x00000836
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, #0
	beq _080490FC
	ldr r2, _0804910C @ =0x0000083C
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _08049114
_080490FC:
	adds r0, r6, #0
	bl Proc_Break
	b _08049160
	.align 2, 0
_08049104: .4byte gpKeySt
_08049108: .4byte gUnknown_0812A15C
_0804910C: .4byte 0x0000083C
_08049110: .4byte 0x00000836
_08049114:
	bl sub_08019260
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08049160
	bl sub_08048EC4
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	bne _08049160
	ldr r1, [r4]
	ldr r0, _08049168 @ =0x00000839
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	beq _08049154
	ldr r0, _0804916C @ =gUnknown_08499578
	ldr r0, [r0]
	movs r1, #4
	str r1, [sp]
	str r2, [sp, #4]
	movs r1, #7
	movs r2, #0xf
	movs r3, #0x17
	bl sub_08012BC8
_08049154:
	movs r0, #0x71
	bl sub_0803B4DC
	adds r0, r6, #0
	bl Proc_Break
_08049160:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08049168: .4byte 0x00000839
_0804916C: .4byte gUnknown_08499578

