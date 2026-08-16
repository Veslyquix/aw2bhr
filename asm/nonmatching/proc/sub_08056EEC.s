	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08056EEC
sub_08056EEC: @ 0x08056EEC
	push {r4, r5, lr}
	sub sp, #0xc
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r2, #0x10
	mov r5, sp
	ldr r3, _08056F6C @ =gUnknown_08553874
	lsls r4, r0, #1
	adds r3, r4, r3
	ldr r1, _08056F70 @ =gUnknown_08553864
	lsrs r2, r2, #0xf
	adds r2, r2, r1
	ldrh r1, [r2]
	ldrh r3, [r3]
	adds r1, r1, r3
	strh r1, [r5]
	mov r1, sp
	adds r1, #2
	movs r2, #5
	strh r2, [r1]
	add r1, sp, #4
	strh r2, [r1]
	ldr r5, _08056F74 @ =gUnknown_08553878
	ldr r3, _08056F78 @ =gUnknown_085D6A48
	ldr r1, _08056F7C @ =gUnknown_03004580
	lsls r2, r0, #4
	adds r1, #2
	adds r2, r2, r1
	ldrh r2, [r2]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	ldrh r1, [r1, #2]
	lsls r1, r1, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	mov r0, sp
	adds r0, #6
	strh r1, [r0]
	ldr r0, _08056F80 @ =gUnknown_08553888
	adds r0, r4, r0
	ldrh r1, [r0]
	add r0, sp, #8
	strh r1, [r0]
	ldr r0, _08056F84 @ =gUnknown_08553884
	adds r4, r4, r0
	ldrh r1, [r4]
	mov r0, sp
	adds r0, #0xa
	strh r1, [r0]
	mov r0, sp
	bl sub_08056F8C
	ldr r1, _08056F88 @ =gUnknown_03004534
	movs r0, #1
	strh r0, [r1]
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056F6C: .4byte gUnknown_08553874
_08056F70: .4byte gUnknown_08553864
_08056F74: .4byte gUnknown_08553878
_08056F78: .4byte gUnknown_085D6A48
_08056F7C: .4byte gUnknown_03004580
_08056F80: .4byte gUnknown_08553888
_08056F84: .4byte gUnknown_08553884
_08056F88: .4byte gUnknown_03004534

