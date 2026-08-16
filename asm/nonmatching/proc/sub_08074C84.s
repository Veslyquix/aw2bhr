	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074C84
sub_08074C84: @ 0x08074C84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	adds r7, r1, #0
	mov r8, r2
	lsls r3, r3, #0x18
	cmp r3, #0
	bne _08074CAA
	adds r0, r7, #0
	bl sub_08074BDC
	adds r6, r0, #0
	mov r0, r8
	bl sub_08074C1C
	b _08074CB8
_08074CAA:
	adds r0, r7, #0
	bl sub_08074C5C
	adds r6, r0, #0
	mov r0, r8
	bl sub_08074C70
_08074CB8:
	adds r5, r0, #0
	ldr r0, _08074CE0 @ =gUnknown_081CC4E0
	ldr r2, [r0]
	movs r3, #0
	ldrsh r1, [r2, r3]
	mov sl, r0
	cmp r6, r1
	bne _08074CD0
	movs r1, #2
	ldrsh r0, [r2, r1]
	cmp r5, r0
	beq _08074CDC
_08074CD0:
	ldr r4, _08074CE4 @ =gUnknown_08614314
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _08074CE8
_08074CDC:
	movs r0, #0
	b _08074D1A
	.align 2, 0
_08074CE0: .4byte gUnknown_081CC4E0
_08074CE4: .4byte gUnknown_08614314
_08074CE8:
	mov r3, sb
	cmp r3, #0
	beq _08074CF8
	adds r0, r4, #0
	mov r1, sb
	bl Proc_StartBlocking
	b _08074D00
_08074CF8:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
_08074D00:
	adds r2, r0, #0
	mov r1, sl
	ldr r0, [r1]
	ldrh r1, [r0]
	strh r1, [r2, #0x30]
	ldrh r0, [r0, #2]
	strh r0, [r2, #0x32]
	strh r6, [r2, #0x2c]
	strh r5, [r2, #0x2e]
	strh r7, [r2, #0x34]
	mov r3, r8
	strh r3, [r2, #0x36]
	movs r0, #1
_08074D1A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

