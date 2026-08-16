	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044994
sub_08044994: @ 0x08044994
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	ble _08044A70
	ldr r2, _08044A84 @ =gUnknown_08499594
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r2]
	adds r0, r0, r1
	ldrb r1, [r0, #2]
	mov r8, r1
	ldrb r6, [r0, #3]
	subs r1, r6, #2
	adds r4, #0x64
	movs r3, #0
	ldrsh r2, [r4, r3]
	mov r0, r8
	bl sub_08044854
	movs r0, #1
	rsbs r0, r0, #0
	add r0, r8
	mov sl, r0
	subs r5, r6, #1
	movs r1, #0
	ldrsh r2, [r4, r1]
	adds r1, r5, #0
	bl sub_08044854
	movs r3, #0
	ldrsh r2, [r4, r3]
	mov r0, r8
	adds r1, r5, #0
	bl sub_08044854
	movs r0, #1
	add r0, r8
	mov sb, r0
	movs r1, #0
	ldrsh r2, [r4, r1]
	adds r1, r5, #0
	bl sub_08044854
	mov r0, r8
	subs r0, #2
	movs r3, #0
	ldrsh r2, [r4, r3]
	adds r1, r6, #0
	bl sub_08044854
	movs r0, #0
	ldrsh r2, [r4, r0]
	mov r0, sl
	adds r1, r6, #0
	bl sub_08044854
	movs r1, #0
	ldrsh r2, [r4, r1]
	mov r0, r8
	adds r1, r6, #0
	bl sub_08044854
	movs r3, #0
	ldrsh r2, [r4, r3]
	mov r0, sb
	adds r1, r6, #0
	bl sub_08044854
	mov r0, r8
	adds r0, #2
	movs r1, #0
	ldrsh r2, [r4, r1]
	adds r1, r6, #0
	bl sub_08044854
	adds r5, r6, #1
	movs r3, #0
	ldrsh r2, [r4, r3]
	mov r0, sl
	adds r1, r5, #0
	bl sub_08044854
	movs r0, #0
	ldrsh r2, [r4, r0]
	mov r0, r8
	adds r1, r5, #0
	bl sub_08044854
	movs r1, #0
	ldrsh r2, [r4, r1]
	mov r0, sb
	adds r1, r5, #0
	bl sub_08044854
	adds r6, #2
	movs r3, #0
	ldrsh r2, [r4, r3]
	mov r0, r8
	adds r1, r6, #0
	bl sub_08044854
_08044A70:
	bl sub_08039F58
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08044A84: .4byte gUnknown_08499594

