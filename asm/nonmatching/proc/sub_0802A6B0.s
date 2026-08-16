	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802A6B0
sub_0802A6B0: @ 0x0802A6B0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0802A734 @ =gUnknown_0849FB44
	bl Proc_Find
	cmp r0, #0
	bne _0802A7A4
	ldr r3, _0802A738 @ =gUnknown_08090B88
	ldr r5, [r3]
	ldr r2, _0802A73C @ =gUnknown_08090B8C
	ldr r4, [r2]
	movs r0, #0
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r5
	movs r1, #0x38
	ldrsh r0, [r0, r1]
	mov sb, r3
	mov r8, r2
	cmp r0, #0x32
	bgt _0802A79A
	ldr r7, _0802A740 @ =gUnknown_08499594
	adds r6, r5, #0
	adds r5, r4, #0
_0802A6E8:
	movs r2, #0
	ldrsh r1, [r5, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r6
	ldr r1, _0802A744 @ =gUnknown_03003F2C
	movs r3, #0x38
	ldrsh r0, [r0, r3]
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r7]
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0
	beq _0802A758
	adds r0, r4, #0
	bl sub_080253B0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802A758
	ldrb r1, [r4, #4]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _0802A748
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	adds r1, r0, #1
	b _0802A74A
	.align 2, 0
_0802A734: .4byte gUnknown_0849FB44
_0802A738: .4byte gUnknown_08090B88
_0802A73C: .4byte gUnknown_08090B8C
_0802A740: .4byte gUnknown_08499594
_0802A744: .4byte gUnknown_03003F2C
_0802A748:
	movs r1, #0
_0802A74A:
	adds r0, r4, #0
	bl sub_08025B24
	adds r0, r4, #0
	bl sub_0804018C
	b _0802A7A4
_0802A758:
	movs r0, #0
	ldrsh r1, [r5, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r6
	ldrh r1, [r0, #0x38]
	adds r1, #1
	strh r1, [r0, #0x38]
	movs r2, #0
	ldrsh r1, [r5, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r6
	movs r3, #0x38
	ldrsh r0, [r0, r3]
	cmp r0, #0x32
	ble _0802A6E8
	mov r0, sb
	ldr r2, [r0]
	mov r1, r8
	ldr r0, [r1]
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r2
	movs r1, #0x38
	ldrsh r0, [r0, r1]
	cmp r0, #0x32
	ble _0802A7A4
_0802A79A:
	mov r2, r8
	ldr r0, [r2]
	ldrb r0, [r0]
	bl sub_08015C30
_0802A7A4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

