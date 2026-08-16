	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806BF40
sub_0806BF40: @ 0x0806BF40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	movs r5, #0
	ldr r1, _0806BFEC @ =gUnknown_0858265C
	ldr r0, [r0, #0x38]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov sl, r0
	mov sb, r5
	ldr r7, _0806BFF0 @ =gUnknown_08499578
	movs r0, #0x52
	mov r8, r0
	mov r4, sl
	movs r6, #0x92
_0806BF68:
	mov r1, sb
	lsls r2, r1, #3
	ldr r0, [r4]
	cmp r0, #1
	bne _0806BF84
	ldr r0, [r7]
	add r0, r8
	mov r1, sl
	adds r1, #4
	adds r1, r1, r2
	ldr r1, [r1]
	bl sub_0806BD1C
	adds r5, #1
_0806BF84:
	ldr r0, [r4]
	cmp r0, #3
	bne _0806BF9C
	ldr r0, [r7]
	adds r0, r0, r6
	ldr r1, _0806BFF4 @ =gUnknown_081B9BC8
	movs r2, #0xe0
	bl sub_080718F8
	bl sub_08013AEC
	adds r5, #1
_0806BF9C:
	ldr r0, [r4]
	cmp r0, #4
	bne _0806BFB4
	ldr r0, [r7]
	adds r0, r0, r6
	ldr r1, _0806BFF8 @ =gUnknown_081B9C3C
	movs r2, #0xe0
	bl sub_080718F8
	bl sub_08013AEC
	adds r5, #1
_0806BFB4:
	ldr r0, [r4]
	cmp r0, #5
	bne _0806BFCC
	ldr r0, [r7]
	add r0, r8
	ldr r1, _0806BFFC @ =gUnknown_081B9CC0
	movs r2, #0xe0
	bl sub_080718F8
	bl sub_08013AEC
	adds r5, #1
_0806BFCC:
	movs r2, #0xc0
	add r8, r2
	adds r4, #8
	adds r6, #0xc0
	movs r0, #1
	add sb, r0
	mov r1, sb
	cmp r1, #5
	ble _0806BF68
	cmp r5, #0
	bne _0806C000
	ldr r0, [sp]
	movs r1, #1
	bl Proc_Goto
	b _0806C012
	.align 2, 0
_0806BFEC: .4byte gUnknown_0858265C
_0806BFF0: .4byte gUnknown_08499578
_0806BFF4: .4byte gUnknown_081B9BC8
_0806BFF8: .4byte gUnknown_081B9C3C
_0806BFFC: .4byte gUnknown_081B9CC0
_0806C000:
	movs r0, #0x48
	movs r1, #0
	movs r2, #0xf0
	movs r3, #0xa0
	bl sub_0806B9CC
	movs r0, #0
	ldr r2, [sp]
	str r0, [r2, #0x30]
_0806C012:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

