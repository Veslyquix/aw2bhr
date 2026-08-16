	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080532D8
sub_080532D8: @ 0x080532D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	movs r6, #0
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
_080532EE:
	lsls r0, r6, #2
	adds r1, r6, #1
	str r1, [sp, #4]
	movs r7, #0
	movs r2, #0
	str r2, [sp, #8]
	adds r0, r0, r6
	lsls r1, r0, #3
	lsls r0, r0, #1
	mov sb, r0
	movs r0, #4
	mov sl, r0
	ldr r0, _0805341C @ =gUnknown_020296B0
	adds r0, #2
	adds r5, r1, r0
_0805330C:
	ldr r1, _08053420 @ =gUnknown_02029A10
	movs r0, #0xb4
	muls r0, r6, r0
	ldr r2, [sp, #8]
	adds r0, r2, r0
	adds r4, r0, r1
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0805339E
	cmp r0, r8
	beq _0805333A
	bl sub_080153F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805333A
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	bl sub_08015328
	movs r0, #0
	strh r0, [r4, #0x18]
_0805333A:
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, r8
	beq _08053354
	bl sub_080153F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08053354
	movs r2, #0
	ldrsh r0, [r5, r2]
	bl sub_08015328
_08053354:
	ldr r0, _08053424 @ =gUnknown_020298E0
	lsls r1, r6, #3
	adds r1, r1, r6
	lsls r1, r1, #4
	adds r1, r7, r1
	adds r0, #2
	adds r4, r1, r0
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r8
	beq _0805337C
	bl sub_080153F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805337C
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl sub_08015328
_0805337C:
	ldr r0, _08053428 @ =gUnknown_0202967C
	mov r2, sb
	adds r1, r7, r2
	adds r4, r1, r0
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r8
	beq _0805339E
	bl sub_080153F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805339E
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl sub_08015328
_0805339E:
	ldr r0, _0805342C @ =gUnknown_02029668
	mov r2, sb
	adds r1, r7, r2
	adds r4, r1, r0
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r8
	beq _080533C0
	bl sub_080153F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080533C0
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl sub_08015328
_080533C0:
	adds r5, #2
	adds r7, #2
	ldr r2, [sp, #8]
	adds r2, #0x24
	str r2, [sp, #8]
	movs r0, #1
	rsbs r0, r0, #0
	add sl, r0
	mov r1, sl
	cmp r1, #0
	bge _0805330C
	ldr r6, [sp, #4]
	cmp r6, #1
	ble _080532EE
	ldr r4, _08053430 @ =gUnknown_03004570
	movs r2, #0
	ldrsh r1, [r4, r2]
	cmp r1, r0
	beq _080533FA
	adds r0, r1, #0
	bl sub_080153F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080533FA
	movs r2, #0
	ldrsh r0, [r4, r2]
	bl sub_08015328
_080533FA:
	bl sub_080169E8
	ldr r0, [sp]
	bl Proc_End
	bl sub_08036B34
	bl sub_0801F00C
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805341C: .4byte gUnknown_020296B0
_08053420: .4byte gUnknown_02029A10
_08053424: .4byte gUnknown_020298E0
_08053428: .4byte gUnknown_0202967C
_0805342C: .4byte gUnknown_02029668
_08053430: .4byte gUnknown_03004570

