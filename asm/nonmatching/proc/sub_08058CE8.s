	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08058CE8
sub_08058CE8: @ 0x08058CE8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r5, r1, #0
	mov sb, r2
	mov r8, r3
	ldr r0, [sp, #0x20]
	mov sl, r0
	movs r6, #0
	cmp r4, #0
	blt _08058DB6
	cmp r5, #0
	blt _08058DB6
	ldr r1, _08058DC4 @ =gUnknown_0816D94C
	ldr r0, [r1]
	ldr r3, [r0]
	ldrh r1, [r3]
	cmp r4, r1
	bge _08058DB6
	ldrh r2, [r3, #2]
	cmp r5, r2
	bge _08058DB6
	lsls r2, r5, #1
	ldr r1, _08058DC8 @ =0x0000417A
	adds r0, r3, r1
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r7, r0, r4
	adds r0, r3, #0
	adds r0, #0x12
	adds r0, r0, r7
	ldr r1, _08058DCC @ =gUnknown_03003F38
	ldrb r0, [r0]
	mov ip, r2
	ldrb r1, [r1]
	cmp r0, r1
	beq _08058D3C
	cmp r0, #0
	bne _08058DB6
_08058D3C:
	ldr r1, _08058DD0 @ =gUnknown_03003340
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08058DB6
	ldr r0, _08058DD4 @ =gUnknown_030040D8
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, #0
	beq _08058D66
	ldr r2, _08058DD8 @ =gUnknown_085D5ABC
	adds r1, r0, #0
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #0x1a]
	cmp r0, #0x10
	beq _08058D86
_08058D66:
	ldr r2, _08058DDC @ =gUnknown_085D583C
	ldr r1, _08058DE0 @ =0x00001432
	adds r0, r3, r1
	adds r0, r0, r7
	ldrb r0, [r0]
	movs r1, #0x1f
	ands r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x10
	adds r0, r0, r2
	ldr r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r6, r0, #1
_08058D86:
	ldr r0, _08058DE4 @ =gUnknown_08499590
	ldr r1, [r0]
	ldr r2, _08058DC8 @ =0x0000417A
	adds r0, r1, r2
	add r0, ip
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r2, _08058DE8 @ =0x00003262
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	mov r1, sb
	ands r0, r1
	cmp r0, #0
	bne _08058DA6
	adds r6, #0x64
_08058DA6:
	mov r2, r8
	ldr r0, [r2]
	cmp r6, r0
	blt _08058DB6
	str r6, [r2]
	mov r0, sl
	strh r4, [r0]
	strh r5, [r0, #2]
_08058DB6:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08058DC4: .4byte gUnknown_0816D94C
_08058DC8: .4byte 0x0000417A
_08058DCC: .4byte gUnknown_03003F38
_08058DD0: .4byte gUnknown_03003340
_08058DD4: .4byte gUnknown_030040D8
_08058DD8: .4byte gUnknown_085D5ABC
_08058DDC: .4byte gUnknown_085D583C
_08058DE0: .4byte 0x00001432
_08058DE4: .4byte gUnknown_08499590
_08058DE8: .4byte 0x00003262

